// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/utils/app_colors.dart';

class PDFReader extends StatefulWidget {
  final StudyMaterial studyMaterial;
  const PDFReader({
    Key? key,
    required this.studyMaterial,
  }) : super(key: key);

  @override
  State<PDFReader> createState() => _PDFReaderState();
}

class _PDFReaderState extends State<PDFReader> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  TextEditingController _pageController = TextEditingController();

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
    final material = widget.studyMaterial;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black,),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Поиск по страницам'),
                  content: TextField(
                    controller: _pageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Введите номер страницы',
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Отмена'),
                    ),
                    TextButton(
                      onPressed: () {
                        final int? targetPage =
                            int.tryParse(_pageController.text);
                        if (targetPage != null) {
                          final controller = _controller.future;
                          controller
                              .then((value) => value.setPage(targetPage - 1));
                        }
                        Navigator.of(context).pop();
                      },
                      child: Text('Перейти'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
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
            onRender: (pages1) {
              setState(() {
                pages = pages1;
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
          Positioned(
            bottom: 30.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 150.0.w),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16.sp),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 4.0.h,
                ),
                child: Center(
                  child: Text(
                    currentPage != null && pages != null
                        ? '${currentPage! + 1} / $pages'
                        : '',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
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
