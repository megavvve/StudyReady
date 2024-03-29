import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:study_ready/data/mapper/study_material_mapper.dart';
import 'package:study_ready/data/models/study_material_api.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/domain/repositories/study_material_repository.dart';
import 'package:study_ready/utils/exceptions.dart';

class FirebaseStudyMaterialRepository implements StudyMaterialRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addMaterial(StudyMaterial material) async {
    try {
      final materialApi = StudyMaterialMapper.toApi(material);
      await _firestore.collection('materials').add(materialApi.toJson());
    } catch (e) {
      throw DataStoreException('Failed to add material: $e');
    }
  }

  @override
  Future<StudyMaterial?> getMaterialById(String id) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('materials').doc(id).get();
      if (doc.exists) {
        return StudyMaterialMapper.fromApi(StudyMaterialApi.fromFirestore(doc));
      } else {
        return null;
      }
    } catch (e) {
      throw DataFetchException('Failed to fetch material: $e');
    }
  }

  // @override
  // Future<List<StudyMaterial>> getMaterials() async {
  //   List<StudyMaterial> materials = [];

  //   try {
  //     final storage = FirebaseStorage.instance;

  //     final storageRef = storage.ref();

  //     final ListResult result = await storageRef.listAll();

  //     for (Reference item in result.items) {
  //       final metadata = await item.getMetadata();
  //       final timeCreated = metadata.timeCreated.toString();

  //       String type = metadata.contentType ?? '';

  //       final appDocDir = await getApplicationDocumentsDirectory();
  //       final fileName = metadata.name;
  //       String fileNameWithoutExtension = fileName.split('.').first;
  //       final filePath = "${appDocDir.path}/$fileName";
  //       final file = File(filePath);

  //       await item.writeToFile(file);
  //       final material = StudyMaterial(
  //         id: materials.length + 1,
  //         fileName: fileNameWithoutExtension,
  //         filePath: filePath,
  //         subjectName: '',
  //         uploadDate: timeCreated,
  //         fileType: type,
  //       );
  //       materials.add(material);
  //       await addMaterial(material);
  //     }
  //   } catch (e) {
  //     print('Error fetching materials: $e');
  //   }

  //   return materials;
  // }
  @override
  Future<List<StudyMaterial>> getMaterials() async {
    List<StudyMaterial> materials = [];

    try {
      // final List<StudyMaterial> localMaterials = await _getLocalMaterials();
      // if (localMaterials.isNotEmpty) {
      //   materials.addAll(localMaterials);
      // } else {
      //   final List<StudyMaterial> remoteMaterials = await _getRemoteMaterials();
      //   materials.addAll(remoteMaterials);
      // }
      final List<StudyMaterial> remoteMaterials = await _getRemoteMaterials();
      materials.addAll(remoteMaterials);
    } catch (e) {
      print('Error fetching materials: $e');
    }

    return materials;
  }

  Future<List<StudyMaterial>> _getLocalMaterials() async {
    List<StudyMaterial> localMaterials = [];

    final appDocDir = await getApplicationDocumentsDirectory();
    final storageDirectory = Directory(appDocDir.path);
    if (storageDirectory.existsSync()) {
      final List<FileSystemEntity> files = storageDirectory.listSync();
      for (FileSystemEntity file in files) {
        if (file is File) {
          final String fileName = file.path.split('/').last;
          final String fileNameWithoutExtension = fileName.split('.').first;
          final String filePath = file.path;
          final StudyMaterial material = StudyMaterial(
            id: localMaterials.length + 1,
            fileName: fileNameWithoutExtension,
            filePath: filePath,
            subjectName: '',
            uploadDate: '', // Установите соответствующую дату
            fileType: '', // Установите соответствующий тип файла
          );
          localMaterials.add(material);
        }
      }
    }
    return localMaterials;
  }

  Future<List<StudyMaterial>> _getRemoteMaterials() async {
    List<StudyMaterial> remoteMaterials = [];

    try {
      // Получаем материалы из Firestore
      final List<StudyMaterial> firestoreMaterials =
          await _getFirestoreMaterials();
      remoteMaterials.addAll(firestoreMaterials);

      // Скачиваем материалы из Firebase Storage
      final storage = FirebaseStorage.instance;
      final storageRef = storage.ref();
      final ListResult result = await storageRef.listAll();

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
          fileType: type,
        );
        remoteMaterials.add(material);
      }
    } catch (e) {
      print('Error fetching remote materials: $e');
    }

    return remoteMaterials;
  }

  Future<List<StudyMaterial>> _getFirestoreMaterials() async {
    List<StudyMaterial> firestoreMaterials = [];

    try {
      // Получаем доступ к коллекции "materials" в Firestore
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('materials').get();

      // Обходим каждый документ в коллекции
      querySnapshot.docs.forEach((doc) {
        // Извлекаем данные из документа
        String fileName = doc['fileName'];
        String filePath = doc['filePath'];
        String subjectName = doc['subjectName'];
        String uploadDate = doc['uploadDate'];
        String fileType = doc['fileType'];

        // Создаем объект StudyMaterial и добавляем его в список
        StudyMaterial material = StudyMaterial(
          id: firestoreMaterials.length + 1,
          fileName: fileName,
          filePath: filePath,
          subjectName: subjectName,
          uploadDate: uploadDate,
          fileType: fileType,
        );
        firestoreMaterials.add(material);
      });
    } catch (e) {
      print('Error fetching materials from Firestore: $e');
    }

    return firestoreMaterials;
  }
}
