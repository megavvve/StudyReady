import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/domain/repositories/study_material_repository.dart';
import 'package:study_ready/utils/exceptions.dart';

class FirebaseStudyMaterialRepository implements StudyMaterialRepository {
  final FirebaseStorage firebaseStorage =
      FirebaseStorage.instanceFor(bucket: "gs://studyready-df819.appspot.com");

  @override
  Future<void> addMaterial(StudyMaterial material) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      File file = File(material.filePath);
      // Указываем путь к месту загрузки файла в хранилище
      String storagePath = material.fileName;
      String? uid = sharedPreferences.getString("uid");
      // Получаем ссылку на место загрузки
      Reference reference = firebaseStorage.ref().child('$uid/$storagePath');
      // Загружаем файл по указанному пути
      await reference.putFile(file);
    } catch (e) {
      throw DataStoreException('Failed to add material: $e');
    }
  }

  @override
  Future<StudyMaterial?> getMaterialById(String id) async {
    return null;
    // try {
    //   DocumentSnapshot doc =
    //       await _firestore.collection('materials').doc(id).get();
    //   if (doc.exists) {
    //     return StudyMaterialMapper.fromApi(StudyMaterialApi.fromFirestore(doc));
    //   } else {
    //     return null;
    //   }
    // } catch (e) {
    //   throw DataFetchException('Failed to fetch material: $e');
    // }
  }

  @override
  Future<List<StudyMaterial>> getMaterials() async {
    List<StudyMaterial> remoteMaterials = [];
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? uid = sharedPreferences.getString("uid");
      final storageRefWithUid = firebaseStorage.ref().child('$uid/');
      ListResult result = await storageRefWithUid.listAll();
      if (result.items.isEmpty) {
        final storageRef = firebaseStorage.ref().child('general_files/');

        result = await storageRef.listAll();
        for (Reference item in result.items) {
          final metadata = await item.getMetadata();
          final String fileName = metadata.name;
          final String type = metadata.contentType ?? '';
          final appDocDir = await getApplicationDocumentsDirectory();
          final String filePath = "${appDocDir.path}/$fileName";
          final File file = File(filePath);
          await item.writeToFile(file);

          final StudyMaterial material = StudyMaterial(
            id: remoteMaterials.length + 1,
            fileName: fileName.split('.').first,
            filePath: filePath,
            subjectName: '',
            uploadDate: metadata.timeCreated.toString(),
            fileType: type.split('/').last,
          );
          addMaterial(material);
          remoteMaterials.add(material);
        }
      } else {
        for (Reference item in result.items) {
          final metadata = await item.getMetadata();
          final String fileName = metadata.name;
          final String type = metadata.contentType ?? '';
          final appDocDir = await getApplicationDocumentsDirectory();
          final String filePath = "${appDocDir.path}/$fileName";
          final File file = File(filePath);
          await item.writeToFile(file);

          final StudyMaterial material = StudyMaterial(
            id: remoteMaterials.length + 1,
            fileName: fileName.split('.').first,
            filePath: filePath,
            subjectName: '',
            uploadDate: metadata.timeCreated.toString(),
            fileType: type.split('/').last,
          );

          remoteMaterials.add(material);
        }
      }
    } catch (e) {
      print('Error fetching materials: $e');
    }

    return remoteMaterials;
  }

  @override
  Future<void> deleteMaterial(StudyMaterial material) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      String? uid = sharedPreferences.getString("uid");
      print("*******************");
      print("uid");
      String storagePath = material.fileName;
      Reference reference = firebaseStorage.ref().child('$uid/$storagePath');

      try {
        await reference.delete();
      } catch (e) {
        if (e is FirebaseException && e.code == 'object-not-found') {
          print('Object not found in Firebase Storage: $storagePath');
        } else {
          rethrow; // Повторно выбрасываем исключение, если это не object-not-found
        }
      }

      // Удаляем локальный файл, если он существует
      File file = File(material.filePath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      throw DataStoreException('Failed to delete material: $e');
    }
  }
}
