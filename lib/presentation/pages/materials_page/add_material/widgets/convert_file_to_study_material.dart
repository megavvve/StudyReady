import 'dart:io';

import 'package:study_ready/domain/entities/study_material.dart';

StudyMaterial convertFileToStudyMaterial(
    File file, List<StudyMaterial> materialList) {
  return StudyMaterial(
      id: StudyMaterial.getNextId(materialList),
      fileName: file.path.split('/').last.split('.').first,
      filePath: file.path,
      subjectName: '',
      uploadDate: DateTime.now().toString(),
      fileType: file.path.split('/').last.split('.').last);
}
