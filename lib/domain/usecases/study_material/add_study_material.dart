import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/domain/repositories/study_material_repository.dart';

class AddStudyMaterial {
  final StudyMaterialRepository studyMaterialRepository;

  AddStudyMaterial({required this.studyMaterialRepository});

  Future<void> call(StudyMaterial sm) async {
    await studyMaterialRepository.addMaterial(sm);
  }
}
