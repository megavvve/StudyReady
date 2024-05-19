import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:study_ready/domain/entities/study_material.dart';
import 'package:study_ready/presentation/blocs/study_material_bloc/study_material_bloc.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:study_ready/presentation/pages/materials_page/add_material/widgets/animated_button.dart';
import 'package:study_ready/presentation/pages/materials_page/add_material/widgets/convert_file_to_study_material.dart';
import 'package:study_ready/presentation/pages/materials_page/add_material/widgets/show_material_exists_toast.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/for_widget_of_material_screen/delete_mode_for_materials.dart';
import 'package:study_ready/utils/app_colors.dart';

class AddFilesScreen extends StatefulWidget {
  final DeleteModeForMaterials deleteMode;
  const AddFilesScreen({super.key, required this.deleteMode});

  @override
  AddFilesScreenState createState() => AddFilesScreenState();
}

class AddFilesScreenState extends State<AddFilesScreen> {
  List<File> files = [];
  bool _showButtons = false;
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
  }

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
    setState(() {
      _isLoading =
          true; // Устанавливаем флаг загрузки в true при начале загрузки
    });
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: fileTypeParam,
      allowMultiple: false,
      allowedExtensions: allowedExtensions,
    );
    setState(() {
      _isLoading =
          false; // Устанавливаем флаг загрузки в false после завершения загрузки
    });
    if (result != null) {
      File file = File(result.files.single.path!);
      int fileSizeInBytes = await file.length();

      // Проверяем размер файла (в байтах)
      if (fileSizeInBytes <= 30 * 1024 * 1024) {
        setState(() {
          files.addAll(
            result.files.map(
              (file) => File(
                file.path!,
              ),
            ),
          );
        });
        print('Выбранный файл меньше или равен 30 МБ');
      } else {
        // Файл слишком большой, предоставляем обратную связь пользователю
        print('Выбранный файл больше 30 МБ');
      }
    } else {
      // Пользователь не выбрал файл, предоставляем обратную связь
      print('Файл не выбран');
    }
    setState(() {
      _showButtons = false;
    });
  }

  void _removeFile(int index) {
    setState(() {
      files.removeAt(index);
    });
  }

  void _toggleButtons() {
    setState(() {
      _showButtons = !_showButtons;
    });
  }

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return BlocBuilder<StudyMaterialBloc, StudyMaterialState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: brightness == Brightness.dark
              ? backgroundColorDark
              : backgroundColorLight,
          body: PopScope(
            canPop: (files.isNotEmpty) ? false : true,
            onPopInvoked: (bool didPop) async {
              if (didPop) {
                return;
              }
              final bool shouldPop = await _showBackDialog(context) ?? false;
              if (context.mounted && shouldPop) {
                Navigator.pop(context);
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Stack(
                children: [
                  Positioned(
                    bottom: _showButtons ? 0.h : 195.h,
                    child: !_showButtons
                        ? SizedBox(
                            width: 450.w,
                            height: 650.h,
                            child: const RiveAnimation.asset(
                              'assets/rive/pencil_dude_hello.riv',
                              fit: BoxFit.cover,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: brightness == Brightness.dark
                            ? backgroundColorDark
                            : backgroundColorLight,
                        title: const Text('Добавить материал'),
                        floating: true,
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 600),
                              height: _showButtons ? 150.h : 350.h,
                            ),
                            SizedBox(
                              width: 250.w,
                              height: 50.h,
                              child: ElevatedButton(
                                onPressed: _toggleButtons,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: brightness == Brightness.dark
                                      ? colorForButton
                                      : mainColorLight,
                                ),
                                child: Text(
                                  'Добавить материал',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0.h),
                            AnimatedOpacity(
                              opacity: _showButtons ? 1.0 : 0.0,
                              duration: const Duration(
                                milliseconds: 500,
                              ),
                              child: _showButtons
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () => _pickFile('pdf'),
                                          child: const Text('Добавить PDF'),
                                        ),
                                        // SizedBox(
                                        //   height: 8.0.h,
                                        // ),
                                        // ElevatedButton(
                                        //   onPressed: () => _pickFile('image'),
                                        //   child: const Text(
                                        //       'Добавить изображение'),
                                        // ),
                                        // SizedBox(
                                        //   height: 8.0.h,
                                        // ),
                                        // ElevatedButton(
                                        //   onPressed: () => _pickFile('video'),
                                        //   child: const Text('Добавить видео'),
                                        // ),
                                        SizedBox(
                                          height: 5.0.h,
                                        ),
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ],
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return ListTile(
                              title: Text(files[index].path.split('/').last),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _removeFile(index),
                              ),
                            );
                          },
                          childCount: files.length,
                        ),
                      ),
                      (files.isNotEmpty)
                          ? SliverToBoxAdapter(
                              child: Column(
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                AnimatedPulseButton(
                                  onPressed: () async {
                                    bool containsFile = false;
                                    final List<File> filesCopy =
                                        List.from(files);
                                    final studyMaterialBloc =
                                        BlocProvider.of<StudyMaterialBloc>(
                                            context);

                                    final studyMaterialsPaths = widget
                                        .deleteMode.listOfStudyMaterials
                                        .map((material) =>
                                            material.filePath.split('/').last)
                                        .toList();
                                    for (var file in filesCopy) {
                                      containsFile = studyMaterialsPaths
                                          .contains(file.path.split('/').last);
                                      if (containsFile) {
                                        showMaterialExistsToast();
                                      }
                                    }
                                    if (!containsFile) {
                                      for (var file in filesCopy) {
                                        StudyMaterial sm =
                                            convertFileToStudyMaterial(
                                          file,
                                          widget
                                              .deleteMode.listOfStudyMaterials,
                                        );
                                        widget.deleteMode
                                            .boolForBugWithBlocList = true;
                                        studyMaterialBloc.add(
                                          AddMaterial(studyMaterial: sm),
                                        );
                                        widget.deleteMode.listOfStudyMaterials
                                            .add(sm);
                                      }
                                    }

                                    setState(() {
                                      files.clear();
                                    });
                                    // Add the material to your Bloc
                                    if (!containsFile) {
                                      // Переходим на экран MaterialScreen
                                      Navigator.pop(context);
                                    }
                                  },
                                )
                              ],
                            ))
                          : const SliverToBoxAdapter(
                              child: SizedBox.shrink(),
                            ),
                    ],
                  ),
                  if (_isLoading)
                    Container(
                      color: brightness == Brightness.dark
                          ? backgroundColorDark
                          : backgroundColorLight,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<bool?> _showBackDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Вы уверены?'),
        content: const Text(
          'Вы уверены, что хотите выйти? Ваши изменения не будут сохранены.',
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'Да',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Нет'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ],
      );
    },
  );
}
