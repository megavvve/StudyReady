import 'package:study_ready/domain/entities/study_material.dart';

List<StudyMaterial> sortMaterials(
    String sortBy, List<StudyMaterial> materials) {
  switch (sortBy) {
    case 'По умолчанию':
      materials.sort((a, b) => b.id.compareTo(a.id));
      break;
    case 'По названию материала':
      materials.sort((a, b) => a.fileName.compareTo(b.fileName));
      break;
    case 'По дате загрузки':
      materials.sort((a, b) => a.uploadDate.compareTo(b.uploadDate));
    case 'По типу данных':
      materials.sort((a, b) => a.fileType.compareTo(b.fileType));
    default:
      break;
  }
  return materials;
}
