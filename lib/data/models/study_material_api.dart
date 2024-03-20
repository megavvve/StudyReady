import 'package:cloud_firestore/cloud_firestore.dart';

class StudyMaterialApi {
  final String id;
  final String title;
  final String content;
  final String subjectName;
  final DateTime uploadDate;
  final String fileType;

  StudyMaterialApi({
    required this.id,
    required this.title,
    required this.content,
    required this.subjectName,
    required this.uploadDate,
    required this.fileType,
  });

  factory StudyMaterialApi.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return StudyMaterialApi(
      id: doc.id,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      subjectName: data['subjectName'] ?? '',
      uploadDate: (data['uploadDate'] as Timestamp).toDate(),
      fileType: data['fileType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'subjectName': subjectName,
      'uploadDate': uploadDate,
      'fileType': fileType,
    };
  }
}
