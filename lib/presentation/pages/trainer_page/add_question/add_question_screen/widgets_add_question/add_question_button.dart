import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_ready/domain/entities/chapter.dart';
import 'package:study_ready/domain/entities/question.dart';
import 'package:study_ready/domain/entities/subject.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/inherit_for_question_and_answers.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/is_empty_text_field.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/show_validation_error_Snack_bar.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/trainer_screen.dart';
import 'package:study_ready/utils/app_colors.dart';

import 'package:study_ready/domain/entities/theme.dart' as theme;

class AddQuestionButton extends StatelessWidget {
  const AddQuestionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        if (state is TrainerLoadSuccess) {
          final trainerList = state.trainerList;
          return ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(mainColor),
              fixedSize: MaterialStateProperty.all<Size>(
                Size(
                  320.w,
                  60.h,
                ),
              ),
            ),
            onPressed: () async {
              QuestionControllers controllers = QuestionControllers.of(context);
              if (isEmptyTextField(controllers)) {
                showValidationErrorSnackBar(context);
              } else {
                final bloc = context.read<TrainerBloc>();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String? courseNumText = prefs.getString("Номер курса");
                int courseNum =
                    courseNumText != null ? int.parse(courseNumText) : 1;

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
                  courseNumber: courseNum,
                  subject: subject,
                  chapter: chapter,
                  theme: theme1,
                  difficultly: prefs.getString("Сложность") ?? "Легко",
                  questionContext: controllers.questionController.text,
                  rightAnswer: controllers.answerController1.text,
                  incorrectAnswers: [
                    controllers.answerController2.text,
                    controllers.answerController3.text,
                    controllers.answerController4.text,
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

                prefs.clear();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacement(
                  customPageRoute(
                    const TrainerScreen(),
                  ),
                );
              }
            },
            child: Text(
              'Добавить вопрос',
              style: TextStyle(color: Colors.black, fontSize: 20.sp),
            ),
          );
        } else {
          return const CircularProgressIndicator(); // Placeholder for loading state
        }
      },
    );
  }
}
