import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/models/question.dart';
import 'package:study_ready/domain/models/trainer.dart';
import 'package:study_ready/presentation/pages/trainer_page/train_process_screen/widget/answers.dart';
import 'package:study_ready/presentation/pages/trainer_page/train_process_screen/widget/generate_random_answers.dart';

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
    final Question question = questionList[selectedQuestion - 1];
    final List<String> answers = [
      question.rightAnswer,
      question.incorrectAnswers[0],
      question.incorrectAnswers[1],
      question.incorrectAnswers[2],
    ];
    //final List<String> answers =[]
    //  final List<String> answers = generateRandomAnswers(
    //      questionList[selectedQuestion - 1].rightAnswer,questionList[selectedQuestion - 1].incorrectAnswers);
    return Padding(
      padding: EdgeInsets.all(17.0.sp),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.sp),
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
                questionList[selectedQuestion - 1].questionContext,
                style: TextStyle(
                  fontSize: 18.sp, // Размер шрифта
                  fontWeight: FontWeight.w500, // Жирный шрифт для выделения
                  color: Colors.black, // Цвет текста
                  height: 1.5.h, // Межстрочный интервал
                  // Дополнительные параметры, такие как fontFamily, letterSpacing, etc.
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h),
          // вопрос из бд сюда засовывать по selectedQuestion (я так думаю)
          // selectedIndex считается с 0
          Answers(
            list: answers,
          ),
        ],
      ),
    );
  }
}
