class LocalMaterial {
  final int id;
  final String fileName;
  final String filePath;
  final String uploadDate;
  final String fileType;

  LocalMaterial(
      { required this.id,
        required this.fileName,
        required this.filePath,
        required this.uploadDate,
        required this.fileType});
}
