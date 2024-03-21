import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/chapter.dart';
import 'package:study_ready/domain/entities/question.dart';
import 'package:study_ready/domain/entities/subject.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/inherit_for_question_and_answers.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/is_empty_text_field.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/show_validation_error_Snack_bar.dart';
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
            onPressed: () {
              QuestionControllers controllers = QuestionControllers.of(context);
              if (isEmptyTextField(controllers)) {
                showValidationErrorSnackBar(context);
              } else {
                final bloc = context.read<TrainerBloc>();
                int count = state.trainerList.length;
                final question = Question(
                  id: count + 1,
                  courseNumber: 1,
                  subject: Subject(id: 1, name: ''),
                  chapter: Chapter(id: 1, subjectId: 1, name: ''),
                  theme: theme.Theme(
                    id: 1,
                    subject: Subject(id: 1, name: ''),
                    chapter: Chapter(id: 1, subjectId: 1, name: ''),
                    name: '',
                  ),
                  difficultly: "Easy",
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
                  ),
                );

                Navigator.of(context).pop();
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
