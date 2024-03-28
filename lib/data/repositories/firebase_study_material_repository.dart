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

  @override
  Future<List<StudyMaterial>> getMaterials() async {
    List<StudyMaterial> materials = [];

    try {
      final storage = FirebaseStorage.instance;

      final storageRef = storage.ref();

      final ListResult result = await storageRef.listAll();

      for (Reference item in result.items) {
        final metadata = await item.getMetadata();
        final timeCreated = metadata.timeCreated.toString();

        String type = metadata.contentType ?? '';

        final appDocDir = await getApplicationDocumentsDirectory();
        final fileName = metadata.name;
        String fileNameWithoutExtension = fileName.split('.').first;
        final filePath = "${appDocDir.path}/$fileName";
        final file = File(filePath);
        print(type);
        await item.writeToFile(file);
        materials.add(
          StudyMaterial(
            id: materials.length + 1,
            fileName: fileNameWithoutExtension,
            filePath: filePath,
            subjectName: '',
            uploadDate: timeCreated,
            fileType: type,
          ),
        );
      }
    } catch (e) {
      print('Error fetching materials: $e');
    }

    return materials;
  }
}
