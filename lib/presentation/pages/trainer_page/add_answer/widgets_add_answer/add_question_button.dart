import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/models/question.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_answer/widgets_add_answer/inherit_for_question_and_answers.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_answer/widgets_add_answer/is_empty_text_field.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_answer/widgets_add_answer/show_validation_error_Snack_bar.dart';

class AddQuestionButton extends StatelessWidget {
  const AddQuestionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainersBloc, TrainersState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
              Color.fromRGBO(
                119,
                165,
                245,
                1,
              ),
            ),
            fixedSize: MaterialStatePropertyAll(
              Size(
                305.w,
                50.h,
              ),
            ),
          ),
          onPressed: () {
            QuestionControllers controllers = QuestionControllers.of(context);
            if (isEmptyTextField(controllers)) {
              showValidationErrorSnackBar(context);
            } else {
              final bloc = context.read<TrainersBloc>();
              int count = 0;
              for (var i = 0; i < state.trainerList.length; i++) {
                var que = state.trainerList[i].questions;
                for (var j = 0; j < que.length; j++) {
                  count++;
                }
              }
              final question = Question(
                  id: count + 1,
                  courseNumber: 1,
                  subject: "",
                  chapter: '',
                  theme: '',
                  difficultly: "Easy",
                  questionContext: controllers.questionController.text,
                  rightAnswer: controllers.answerController1.text,
                  incorrectAnswers: [
                    controllers.answerController2.text,
                    controllers.answerController3.text,
                    controllers.answerController4.text
                  ]);

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
      },
    );
  }
}
