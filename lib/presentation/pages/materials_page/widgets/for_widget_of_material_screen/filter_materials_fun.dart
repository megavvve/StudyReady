import 'package:study_ready/domain/entities/study_material.dart';

List<StudyMaterial> filterMaterials(
    List<StudyMaterial> materials, String query) {
  if (query.isEmpty) {
    return List.from(materials);
  } else {
    return materials
        .where(
          (material) => material.fileName.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
  }
}
