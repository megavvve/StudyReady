import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:study_ready/utils/app_colors.dart';

class AddFilesScreen extends StatefulWidget {
  const AddFilesScreen({super.key});

  @override
  _AddFilesScreenState createState() => _AddFilesScreenState();
}

class _AddFilesScreenState extends State<AddFilesScreen> {
  List<File> _files = [];
  bool _showButtons = false;

  Future<void> _pickFile(String fileType) async {
    List<String> allowedExtensions = [];
    FileType fileTypeParam = FileType.custom;

    switch (fileType) {
      case 'pdf':
        fileTypeParam = FileType.custom;
        allowedExtensions = ['pdf'];
        break;
      case 'image':
        fileTypeParam = FileType.custom;
        allowedExtensions = ['png', 'jpeg', 'jpg'];
        break;
      case 'video':
        fileTypeParam = FileType.custom;
        allowedExtensions = ['mp4'];
        break;
      default:
        allowedExtensions = [];
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: fileTypeParam,
      allowMultiple: false,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      setState(() {
        _files.addAll(
          result.files.map(
            (file) => File(
              file.path!,
            ),
          ),
        );
      });
    } else {}
  }

  void _removeFile(int index) {
    setState(() {
      _files.removeAt(index);
    });
  }

  void _toggleButtons() {
    setState(() {
      _showButtons = !_showButtons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RiveAnimation.asset(
            'assets/rive/duck_walk.riv',
            fit: BoxFit.cover,
          ),
          CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Добавить файлы'),
                floating: true,
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      height: _showButtons ? 150.h : 300.h,
                    ),
                    SizedBox(
                      width: 250.w,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: _toggleButtons,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(mainColor),
                        ),
                        child: Text(
                          'Добавить материал',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0.h),
                    AnimatedOpacity(
                      opacity: _showButtons ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => _pickFile('pdf'),
                            child: const Text('Добавить PDF'),
                          ),
                          SizedBox(height: 8.0.h),
                          ElevatedButton(
                            onPressed: () => _pickFile('image'),
                            child: const Text('Добавить изображение'),
                          ),
                          SizedBox(height: 8.0.h),
                          ElevatedButton(
                            onPressed: () => _pickFile('video'),
                            child: const Text('Добавить видео'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      title: Text(_files[index].path.split('/').last),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeFile(index),
                      ),
                    );
                  },
                  childCount: _files.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
