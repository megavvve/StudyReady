import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/domain/repositories/study_material_repository.dart';

class GetStudyMaterial {
  final StudyMaterialRepository studyMaterialRepository;

  GetStudyMaterial({required this.studyMaterialRepository});

  Future<StudyMaterial?> call(String id) async {
    return await studyMaterialRepository.getMaterialById(id);
  }
}
