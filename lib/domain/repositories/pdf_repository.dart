import 'dart:io';

abstract class PDFRepository {
  Future<File> loadAsset(String path);

  Future<File> loadNetwork(String url);

  Future<File> pickFile();

  Future<File> loadFirebase(String url);

  Future<File> _storeFile(String url, List<int> bytes);
}
