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
    // Создать множество всех существующих ID
    final existingIds = materialList.map((material) => material.id);
    if (existingIds.isEmpty) {
      return 1;
    }
    // Итерировать от 1 до максимального ID + 1
    for (int i = 1; i <= existingIds.last; i++) {
      // Найти первое число, которое отсутствует в множестве
      if (!existingIds.contains(i)) {
        return i;
      }
    }

    // Если все числа от 1 до максимального ID заняты, вернуть максимальный ID + 1
    return materialList.last.id + 1;
  }
}
