import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:study_ready/domain/entities/study_material.dart';

class FileContent extends StatefulWidget {
  final StudyMaterial material;

  const FileContent({
    Key? key,
    required this.material,
  }) : super(key: key);

  @override
  _FileContentState createState() => _FileContentState();
}

class _FileContentState extends State<FileContent> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  Widget _buildContent() {
    final material = widget.material;
    switch (material.fileType) {
      case 'application/pdf':
        return Stack(
          children: <Widget>[
            PDFView(
              filePath: material.filePath,
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: false,
              pageFling: false,
              pageSnap: true,
              defaultPage: currentPage!,
              fitPolicy: FitPolicy.BOTH,
              preventLinkNavigation: false,
              onRender: (pages) {
                setState(() {
                  pages = pages;
                  isReady = true;
                });
              },
              onViewCreated: (PDFViewController pdfViewController) {
                _controller.complete(pdfViewController);
              },
              onPageChanged: (int? page, int? total) {
                setState(() {
                  currentPage = page;
                });
              },
            ),
            errorMessage.isEmpty
                ? !isReady
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container()
                : Center(
                    child: Text(errorMessage),
                  )
          ],
        );

      case 'txt':
        // Здесь можно вернуть виджет для отображения текста
        return Text('Text content for ${material.filePath}');
      case 'jpg':
      case 'jpeg':
      case 'png':
        // Здесь можно вернуть виджет для отображения изображения
        return Image.network(material.filePath);
      default:
        // Для неизвестного типа файла можно отобразить соответствующее сообщение
        return Text('Unsupported file type');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
