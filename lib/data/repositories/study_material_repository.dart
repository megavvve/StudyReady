import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/domain/repositories/study_material_repository.dart';
import 'package:study_ready/utils/exceptions.dart';

class FirebaseStudyMaterialRepository implements StudyMaterialRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<StudyMaterial>> getMaterials() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('materials').get();
      return snapshot.docs
          .map((doc) => StudyMaterial.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw DataFetchException('Failed to fetch materials: $e');
    }
  }

  @override
  Future<void> addMaterial(StudyMaterial material) async {
    try {
      await _firestore.collection('materials').add(material.toJson());
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
        return StudyMaterial.fromFirestore(doc);
      } else {
        return null;
      }
    } catch (e) {
      throw DataFetchException('Failed to fetch material: $e');
    }
  }
}
