import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_ready/domain/entities/chapter.dart';
import 'package:study_ready/domain/entities/question.dart';
import 'package:study_ready/domain/entities/subject.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/is_empty_text_field.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/show_validation_error_Snack_bar.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/trainer_screen.dart';

import 'package:study_ready/domain/entities/theme.dart' as theme;

class AddQuestionButton extends StatelessWidget {
  const AddQuestionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        if (state is TrainerLoadSuccess) {
          final trainerList = state.trainerList;
          return ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                brightness == Brightness.dark
                    ? const Color.fromARGB(255, 90, 33, 203)
                    : const Color.fromRGBO(119, 165, 245, 1),
              ),
              fixedSize: MaterialStateProperty.all<Size>(
                Size(
                  320.w,
                  60.h,
                ),
              ),
            ),
            onPressed: () {
              if (isEmptyTextField()) {
                showValidationErrorSnackBar(context);
              } else {
                final bloc = context.read<TrainerBloc>();
                SharedPreferences prefs =
                    GetIt.instance.get<SharedPreferences>();
                String? courseNumText = prefs.getString("Номер курса");
                String courseNum = courseNumText ?? "1";

                Subject subject = Subject.findSubjectByName(
                    prefs.getString("Предмет"), trainerList);
                Chapter chapter = Chapter.findChapterByName(
                    prefs.getString("Номер модуля"), subject.id, trainerList);
                theme.Theme theme1 = theme.Theme.findThemeByName(
                    prefs.getString("Тема"),
                    subject.id,
                    chapter.id,
                    trainerList);

                final question = Question(
                  id: Question.getNextId(trainerList),
                  courseNumber: (courseNum == "") ? 1 : int.parse(courseNum),
                  subject: subject,
                  chapter: chapter,
                  theme: theme1,
                  difficultly: prefs.getString("Сложность") ?? "Легко",
                  questionContext: prefs.getString("question")!,
                  rightAnswer: prefs.getString("answer1")!,
                  incorrectAnswers: [
                    prefs.getString("answer2")!,
                    prefs.getString("answer3")!,
                    prefs.getString("answer4")!,
                  ],
                );

                bloc.add(
                  AddQuestion(
                    question: question,
                    trainerToAddTo: Trainer.getTrainerFromMyText(
                      prefs.getString("Добавить в тренажер:"),
                      trainerList,
                    ),
                  ),
                );
                prefs.setString("question", "");
                prefs.setString("answer1", "");
                prefs.setString("answer2", "");
                prefs.setString("answer3", "");
                prefs.setString("answer4", "");
                prefs.setString("Тема", "");
                prefs.setString("Номер модуля", "");
                prefs.setString("Сложность", "");
                prefs.setString("Номер модуля", "");
                prefs.setString("Добавить в тренажер:", "");

                Navigator.of(context).pushReplacement(
                  customPageRoute(
                    const TrainerScreen(),
                  ),
                );
              }
            },
            child: Text(
              'Добавить вопрос',
              style: TextStyle(
                  color: brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20.sp),
            ),
          );
        } else {
          return const CircularProgressIndicator(); // Placeholder for loading state
        }
      },
    );
  }
}
