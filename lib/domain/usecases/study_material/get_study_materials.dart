import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/domain/repositories/study_material_repository.dart';

class GetStudyMaterials {
  final StudyMaterialRepository studyMaterialRepository;

  GetStudyMaterials({required this.studyMaterialRepository});

  Future<List<StudyMaterial>> call() async {
    return await studyMaterialRepository.getMaterials();
  }
}
