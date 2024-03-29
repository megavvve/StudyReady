import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/utils/app_colors.dart';

class MaterialReader extends StatefulWidget {
  final StudyMaterial material;

  const MaterialReader({Key? key, required this.material}) : super(key: key);

  @override
  State<MaterialReader> createState() => _MaterialReaderState();
}

class _MaterialReaderState extends State<MaterialReader> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // Возвращаем вертикальные ориентации при выходе из экрана MaterialReader
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final material = widget.material;
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          style: ButtonStyle(
            animationDuration: Duration.zero, // отключаем анимацию
            overlayColor: MaterialStateProperty.all(
                Colors.transparent), // отключаем эффект нажатия
          ),
          child: Text(
            "Документ",
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          onPressed: () async {
            final controller = await _controller.future;
            await controller.setPage(0); // Переходим на первую страницу
          },
        ),
        centerTitle: true,
        backgroundColor: secondColor,
      ),
      body: Stack(
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
      ),
    );
  }
}
