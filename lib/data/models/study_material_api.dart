import 'package:cloud_firestore/cloud_firestore.dart';

class StudyMaterialApi {
  final int id;
  final String title;
  final String content;
  final String subjectName;
  final String uploadDate;
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
      id: int.parse(data['id']),
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      subjectName: data['subjectName'] ?? '',
      uploadDate: data['uploadDate'] ?? '',
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
