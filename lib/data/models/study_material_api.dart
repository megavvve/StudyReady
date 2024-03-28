import 'package:cloud_firestore/cloud_firestore.dart';

class StudyMaterialApi {
  final int id;
  final String fileName;
  final String filePath;
  final String uploadDate;
  final String fileType;

  StudyMaterialApi({
    required this.id,
    required this.fileName,
    required this.filePath,
    required this.uploadDate,
    required this.fileType,
  });

  factory StudyMaterialApi.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return StudyMaterialApi(
      id: int.parse(data['id']),
      fileName: data['fileName'] ?? '',
      filePath: data['filePath'] ?? '',
      uploadDate: data['uploadDate'] ?? '',
      fileType: data['fileType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fileName': fileName,
      'filePath': filePath,
      'uploadDate': uploadDate,
      'fileType': fileType,
    };
  }
}
