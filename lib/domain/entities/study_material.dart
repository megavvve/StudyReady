class StudyMaterial {
  final String id;
  final String title;
  final String content;
  final String subjectName;
  final DateTime uploadDate;
  final String fileType;

  StudyMaterial({
    required this.id,
    required this.title,
    required this.content,
    required this.subjectName,
    required this.uploadDate,
    required this.fileType,
  });
}
