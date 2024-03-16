import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory StudyMaterial.fromJson(Map<String, dynamic> json) {
    return StudyMaterial(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      subjectName: json['subjectName'],
      uploadDate: DateTime.parse(json['uploadDate']),
      fileType: json['fileType'],
    );
  }
  factory StudyMaterial.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return StudyMaterial(
      id: doc.id,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      subjectName: data['subjectName'] ?? '',
      uploadDate: DateTime.parse(
        data['uploadDate'],
      ),
      fileType: data['fileType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'subjectName': subjectName,
      'uploadDate': uploadDate.toIso8601String(),
      'fileType': fileType,
    };
  }
}

List<StudyMaterial> testMaterials = [
  StudyMaterial(
    id: '1',
    title: 'Introduction to Programming',
    content: 'This is a PDF document introducing programming concepts.',
    subjectName: 'Computer Science',
    uploadDate: DateTime.now(),
    fileType: 'pdf',
  ),
  StudyMaterial(
    id: '2',
    title: 'History Notes',
    content: 'These are history notes in text format.',
    subjectName: 'History',
    uploadDate: DateTime.now().subtract(const Duration(days: 2)),
    fileType: 'txt',
  ),
  StudyMaterial(
    id: '3',
    title: 'Chemistry Lab Report',
    content: 'Lab report on chemical reactions conducted in the laboratory.',
    subjectName: 'Chemistry',
    uploadDate: DateTime.now().subtract(const Duration(days: 5)),
    fileType: 'pdf',
  ),
];

StudyMaterial testMaterial = StudyMaterial(
  id: '1',
  title: 'Sample Material',
  content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
  subjectName: 'Sample Subject',
  uploadDate: DateTime.now(),
  fileType: 'pdf',
);
