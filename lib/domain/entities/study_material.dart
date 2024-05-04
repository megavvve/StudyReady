class StudyMaterial {
  final int id;
  final String fileName;
  final String filePath;
  final String subjectName;
  final String uploadDate;
  final String fileType;

  StudyMaterial({
    required this.id,
    required this.fileName,
    required this.filePath,
    required this.subjectName,
    required this.uploadDate,
    required this.fileType,
  });
  static int getNextId(List<StudyMaterial> materialList) {
    int maxId = 0;
    for (var material in materialList) {
      if (material.id > maxId) {
        maxId = material.id;
      }
    }
    return maxId + 1;
  }
}
