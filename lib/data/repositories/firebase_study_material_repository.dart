import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:study_ready/data/datasources/local/app_db.dart';
import 'package:study_ready/data/mapper/study_material_mapper.dart';
import 'package:study_ready/data/models/study_material_api.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/domain/repositories/study_material_repository.dart';
import 'package:study_ready/utils/exceptions.dart';

class FirebaseStudyMaterialRepository implements StudyMaterialRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AppDB appDB = GetIt.instance.get<AppDB>();

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
    final localMaterials = await appDB.getMaterials();
    try {
      if (localMaterials.isEmpty) {
        final List<StudyMaterial> remoteMaterials = await _getRemoteMaterials();
        materials.addAll(remoteMaterials);
      } else {
        final List<StudyMaterial> localMaterials = await _getLocalMaterials();
        materials.addAll(localMaterials);
      }
    } catch (e) {
      print('Error fetching materials: $e');
    }

    return materials;
  }

  Future<List<StudyMaterial>> _getLocalMaterials() async {
    List<StudyMaterial> localMaterials = [];
    final materialsFromDb = await appDB.getMaterials();
    for (var element in materialsFromDb) {
      final StudyMaterial material = StudyMaterial(
        id: element.id,
        fileName: element.fileName,
        filePath: element.filePath,
        subjectName: '',
        uploadDate: element.uploadDate,
        fileType: element.fileType,
      );
      localMaterials.add(material);
    }
    return localMaterials;
  }

  Future<List<StudyMaterial>> _getRemoteMaterials() async {
    List<StudyMaterial> remoteMaterials = [];

    try {
      final storage = FirebaseStorage.instanceFor(
          bucket: "gs://studyready-df819.appspot.com");
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
        appDB.insertMaterial(
            StudyMaterialMapper.mapStudyMaterialToMaterialsTableCompanion(
                material));
      }
    } catch (e) {
      print('Error fetching remote materials: $e');
    }

    return remoteMaterials;
  }
}
