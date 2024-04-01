import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/add_trainer_dialog.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/question_params/widgets_answer_parametrs/add_text_dialog.dart';
import 'package:study_ready/utils/app_colors.dart';

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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.param,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: const Color(0xFFB8D3FF),
                borderRadius: BorderRadius.circular(16.sp),
              ),
              child: Stack(
                children: [
                  EasyAutocomplete(
                    keyboardType: TextInputType.none,
                    controller: customTextEditingController,
                    suggestions: _buildPopupMenuItems(trainers),
                    suggestionBackgroundColor: secondColor,
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
                      if (customTextEditingController.text != "Добавить +") {
                        prefs = await SharedPreferences.getInstance();
                        prefs.setString(widget.param, value);
                      } else {
                        if (widget.param != "Добавить в тренажер:") {
                          showAddTextDialog(context);
                        } else {
                          showAddTrainerDialog(context, trainers);
                        }
                      }
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
                              fontWeight: FontWeight.w300),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  void showAddTextDialog(BuildContext context) async {
    final enteredText = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return const AddTextDialog();
      },
    );
    if (enteredText != null) {
      setState(() {
        customTextEditingController.text = enteredText;
      });
      prefs.setString(widget.param, enteredText);
    }
  }

  void showAddTrainerDialog(
      BuildContext context, List<Trainer> trainers) async {
    final enteredText = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AddTrainerDialog(
          trainers: trainers,
        );
      },
    );
    if (enteredText != null) {
      setState(() {
        customTextEditingController.text = enteredText;
      });
      prefs.setString(widget.param, enteredText);
    }
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
      case "Глава":
        options = getModuleNumbersFromTrainers(trainers);
        break;
      case "Тема":
        options = getThemesFromTrainers(trainers);
        break;
      case "Сложность":
        options = ["Легкий", "Средний", "Сложный"];
        break;
      case "Добавить в тренажер:":
        options = getTrainers(trainers);
        break;
    }
    options.add("Добавить +");
    return options;
  }
}

List<String> getSubjectsFromTrainers(List<Trainer> trainers) {
  Set<String> subjectsSet = {}; // Используем множество для уникальных предметов
  for (var trainer in trainers) {
    subjectsSet.add(trainer.subjectName);
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

List<String> getTrainers(List<Trainer> trainers) {
  List<String> trainersList = []; // Используем множество для уникальных тем
  for (var trainer in trainers) {
    String string =
        "Тренажер: ${trainer.trainerName}, предмет: ${trainer.subjectName}";
    trainersList.add(string);
  }
  return trainersList.toList(); // Возвращаем список уникальных тем
}
