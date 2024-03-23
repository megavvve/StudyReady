import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';

class CardForQuestionParams extends StatefulWidget {
  final String param;

  const CardForQuestionParams({
    Key? key,
    required this.param,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CardForQuestionParamsState createState() => _CardForQuestionParamsState();
}

class _CardForQuestionParamsState extends State<CardForQuestionParams> {
  List<Trainer> trainers = [];
  late SharedPreferences prefs;

  late TextEditingController customTextEditingController;

  @override
  void initState() {
    super.initState();
    customTextEditingController = TextEditingController();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    String? text = prefs.getString(widget.param);

    setState(() {
      customTextEditingController.text = text ?? ''; // Установка текста здесь
    });
  }

  @override
  void dispose() {
    customTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(builder: (context, state) {
      if (state is TrainerLoadSuccess) {
        trainers = state.trainerList;
      }

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.param,
                      style: TextStyle(
                        fontSize: 20.w,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(198, 216, 245, 1),
                    borderRadius: BorderRadius.circular(16.sp),
                  ),
                  child: Stack(
                    children: [
                      EasyAutocomplete(
                        keyboardType: TextInputType.none,
                        controller: customTextEditingController,
                        suggestions: _buildPopupMenuItems(trainers),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 10.h,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.sp),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              style: BorderStyle.solid,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.sp),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              style: BorderStyle.solid,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                customTextEditingController.text = "";
                                prefs.setString(widget.param, "");
                              });
                            },
                            icon: const Icon(Icons.clear),
                          ),
                        ),
                        onChanged: (value) async {
                          prefs = await SharedPreferences.getInstance();
                          prefs.setString(widget.param, value);
                        },
                        suggestionBuilder: (data) {
                          return Container(
                            margin: EdgeInsets.all(2.h),
                            padding: EdgeInsets.all(5.sp),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                            child: Text(
                              data,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  List<String> _buildPopupMenuItems(List<Trainer> trainers) {
    List<String> options = [];

    // В зависимости от параметра, определяем возможные варианты
    switch (widget.param) {
      case "Предмет":
        options = getSubjectsFromTrainers(trainers);
        break;
      case "Номер курса":
        options = getCourseNumbersFromTrainers(trainers);
        break;
      case "Номер модуля":
        options = getModuleNumbersFromTrainers(trainers);
        break;
      case "Тема":
        options = getThemesFromTrainers(trainers);
        break;
      case "Сложность":
        options = ["Легкий", "Средний", "Сложный"];
        break;
    }

    return options;
  }
}

List<String> getSubjectsFromTrainers(List<Trainer> trainers) {
  Set<String> subjectsSet = {}; // Используем множество для уникальных предметов
  for (var trainer in trainers) {
    for (var question in trainer.questions) {
      subjectsSet.add(
          question.subject.name.toString()); // Добавляем предмет в множество
    }
  }
  return subjectsSet.toList(); // Преобразуем множество в список и возвращаем
}

List<String> getCourseNumbersFromTrainers(List<Trainer> trainers) {
  Set<String> courseNumbersSet =
      {}; // Используем множество для уникальных номеров курсов
  for (var trainer in trainers) {
    for (var question in trainer.questions) {
      courseNumbersSet.add(question.courseNumber
          .toString()); // Добавляем номер курса в множество
    }
  }
  return courseNumbersSet.toList(); // Возвращаем список строковых значений
}

List<String> getModuleNumbersFromTrainers(List<Trainer> trainers) {
  Set<String> moduleNumbersSet =
      {}; // Используем множество для уникальных номеров модулей
  for (var trainer in trainers) {
    for (var question in trainer.questions) {
      moduleNumbersSet
          .add(question.chapter.name); // Добавляем номер модуля в множество
    }
  }

  return moduleNumbersSet.toList(); // Возвращаем список строковых значений
}

List<String> getThemesFromTrainers(List<Trainer> trainers) {
  Set<String> themesSet = {}; // Используем множество для уникальных тем
  for (var trainer in trainers) {
    for (var question in trainer.questions) {
      themesSet.add(question.theme.name); // Добавляем тему в множество
    }
  }
  return themesSet.toList(); // Возвращаем список уникальных тем
}
