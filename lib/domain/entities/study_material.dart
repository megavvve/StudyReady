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
    if (materialList.isEmpty) {
      return 1;
    }

    // Сортируем список по id
    materialList.sort((a, b) => a.id.compareTo(b.id));

    // Проверяем наличие пропусков
    for (int i = 0; i < materialList.length - 1; i++) {
      if (materialList[i + 1].id > materialList[i].id + 1) {
        return materialList[i].id + 1;
      }
    }

    // Если пропусков нет, возвращаем максимальный id + 1
    return materialList.last.id + 1;
  }
}
