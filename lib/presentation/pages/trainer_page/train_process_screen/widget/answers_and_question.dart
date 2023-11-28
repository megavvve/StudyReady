import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/models/question.dart';
import 'package:study_ready/domain/models/trainer.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/trainer_page/train_process_screen/widget/answers.dart';

import 'inherited_widget_check.dart';

class AnswersAndQuestion extends StatefulWidget {
  final Trainer trainer;
  const AnswersAndQuestion({super.key, required this.trainer});

  @override
  State<AnswersAndQuestion> createState() => _AnswersAndQuestionState();
}

class _AnswersAndQuestionState extends State<AnswersAndQuestion> {
  
  @override
  Widget build(BuildContext context) {

  
    int selectedQuestion = SharedState.of(context).selectedQuestion;

    Trainer trainer = widget.trainer;
    final List<Question> questionList = trainer.questions;
 
    return BlocBuilder<TrainersBloc, TrainersState>(
      builder: (context, state) {
        
        final answers = state.currentAnswers[
            (selectedQuestion > questionList.length)
                ? 1
                : selectedQuestion - 1];
        return Padding(
          padding: EdgeInsets.all(
            17.0.sp,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(
                  16.sp,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      14.sp,
                    ),
                  ),
                ),
                width: 335.w,
                child: Center(
                  child: Text(
                    questionList[(selectedQuestion > questionList.length)
                            ? 1
                            : selectedQuestion - 1]
                        .questionContext,
                    style: TextStyle(
                      fontSize: 18.sp, // Размер шрифта
                      fontWeight: FontWeight.w500, // Жирный шрифт для выделения
                      color: Colors.black, // Цвет текста
                      height: 1.5.h, // Межстрочный интервал
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Answers(
                list: answers,
              ),
            ],
          ),
        );
      },
    );
  }
}
