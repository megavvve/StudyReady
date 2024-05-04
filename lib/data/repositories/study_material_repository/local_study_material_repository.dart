import 'package:get_it/get_it.dart';
import 'package:study_ready/data/datasources/local/app_db.dart';
import 'package:study_ready/data/mapper/study_material_mapper.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/domain/repositories/study_material_repository.dart';

class LocalStudyMaterialRepository implements StudyMaterialRepository {
  AppDB appDB = GetIt.instance.get<AppDB>();
  @override
  Future<void> addMaterial(StudyMaterial material) async {
    try {
      await appDB.insertMaterial(
        StudyMaterialMapper.toLocal(
          material,
        ),
      ); // Assuming insertMaterial method exists in AppDB
    } catch (e) {
      throw Exception('Failed to add material: $e');
    }
  }

  @override
  Future<StudyMaterial?> getMaterialById(String id) async {
    try {
      return StudyMaterialMapper.fromLocal(
        await appDB.getMaterial(
          int.parse(id),
        ),
      ); // Assuming getMaterialById method exists in AppDB
    } catch (e) {
      throw Exception('Failed to get material by ID: $e');
    }
  }

  @override
  Future<List<StudyMaterial>> getMaterials() async {
    try {
      return StudyMaterialMapper.fromLocalList(await appDB
          .getMaterials()); // Assuming getMaterialById method exists in AppDB
    } catch (e) {
      throw Exception('Failed to get material by ID: $e');
    }
  }
}
