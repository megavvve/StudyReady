import 'package:study_ready/data/models/study_material_api.dart';
import 'package:study_ready/domain/entities/study_material.dart';

class StudyMaterialMapper {
  static StudyMaterial fromApi(StudyMaterialApi apiModel) {
    return StudyMaterial(
      id: apiModel.id,
      title: apiModel.title,
      content: apiModel.content,
      subjectName: apiModel.subjectName,
      uploadDate: apiModel.uploadDate,
      fileType: apiModel.fileType,
    );
  }

  static StudyMaterialApi toApi(StudyMaterial domainModel) {
    return StudyMaterialApi(
      id: domainModel.id,
      title: domainModel.title,
      content: domainModel.content,
      subjectName: domainModel.subjectName,
      uploadDate: domainModel.uploadDate,
      fileType: domainModel.fileType,
    );
  }

  static List<StudyMaterial> fromApiList(List<StudyMaterialApi> apiList) {
    return apiList
        .map((apiModel) => StudyMaterialMapper.fromApi(apiModel))
        .toList();
  }

  static List<StudyMaterialApi> toApiList(List<StudyMaterial> domainList) {
    return domainList
        .map((domainModel) => StudyMaterialMapper.toApi(domainModel))
        .toList();
  }
}
