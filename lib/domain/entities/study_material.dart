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

List<StudyMaterial> generateTestStudyMaterials() {
  return [
    StudyMaterial(
      id: '1',
      title: 'Introduction to Biology',
      content: 'This is an introductory chapter to biology.',
      subjectName: 'Biology',
      uploadDate: DateTime(2023, 10, 15),
      fileType: 'pdf',
    ),
    StudyMaterial(
      id: '2',
      title: 'Newton\'s Laws of Motion',
      content: 'Overview of Newton\'s laws of motion.',
      subjectName: 'Physics',
      uploadDate: DateTime(2023, 9, 20),
      fileType: 'docx',
    ),
    StudyMaterial(
      id: '3',
      title: 'Romeo and Juliet',
      content: 'The famous Shakespearean tragedy.',
      subjectName: 'English Literature',
      uploadDate: DateTime(2023, 8, 5),
      fileType: 'txt',
    ),
    StudyMaterial(
      id: '4',
      title: 'World War II Timeline',
      content: 'Timeline of major events during World War II.',
      subjectName: 'History',
      uploadDate: DateTime(2023, 7, 12),
      fileType: 'pdf',
    ),
  ];
}
