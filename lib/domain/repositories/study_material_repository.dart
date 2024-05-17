import 'package:study_ready/domain/entities/study_material.dart';

abstract class StudyMaterialRepository {
  Future<List<StudyMaterial>> getMaterials();
  Future<void> addMaterial(StudyMaterial material);
  Future<StudyMaterial?> getMaterialById(String id);
}
