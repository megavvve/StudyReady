import 'package:drift/drift.dart';
import 'package:study_ready/data/datasources/local/app_db.dart';
import 'package:study_ready/data/models/study_material_api.dart';
import 'package:study_ready/domain/entities/study_material.dart';

class StudyMaterialMapper {
  static StudyMaterial fromApi(StudyMaterialApi apiModel) {
    return StudyMaterial(
      id: apiModel.id,
      fileName: apiModel.fileName,
      filePath: apiModel.filePath,
      subjectName: '',
      uploadDate: apiModel.uploadDate,
      fileType: apiModel.fileType,
    );
  }

  static StudyMaterialApi toApi(StudyMaterial domainModel) {
    return StudyMaterialApi(
      id: domainModel.id,
      fileName: domainModel.fileName,
      filePath: domainModel.filePath,
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

  static MaterialsTableCompanion toLocal(StudyMaterial material) {
    return MaterialsTableCompanion(
      fileName: Value(material.fileName),
      filePath: Value(material.filePath),
      uploadDate: Value(material.uploadDate),
      fileType: Value(material.fileType),
    );
  }

  static StudyMaterial fromLocal(MaterialsTableData material) {
    return StudyMaterial(
      fileName: material.fileName,
      filePath: material.filePath,
      uploadDate: material.uploadDate,
      fileType: material.fileType,
      id: material.id,
      subjectName: '',
    );
  }

  // Static method to create a list of StudyMaterial objects from a list of MaterialsTableData objects
  static List<StudyMaterial> fromLocalList(List<MaterialsTableData> materials) {
    return materials.map((material) => fromLocal(material)).toList();
  }
}
