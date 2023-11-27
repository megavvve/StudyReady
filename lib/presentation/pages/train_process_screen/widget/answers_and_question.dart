import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/train_process_screen/widget/answers.dart';
import 'package:study_ready/presentation/pages/train_process_screen/widget/process_widget.dart';

import 'inherited_widget_check.dart';

class AnswersAndQuestion extends StatefulWidget {
  const AnswersAndQuestion({super.key});

  @override
  State<AnswersAndQuestion> createState() => _AnswersAndQuestionState();
}

class _AnswersAndQuestionState extends State<AnswersAndQuestion> {
  @override
  Widget build(BuildContext context) {
    int selectedQuestion = SharedState.of(context).selectedQuestion;

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
                "Вы на вопросе: $selectedQuestion",
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
            list: [
              "1. ответ 1 вопрос $selectedQuestion",
              "2. ответ 2 вопрос $selectedQuestion",
              "3. ответ 3 вопрос $selectedQuestion",
              "4. ответ 4 вопрос $selectedQuestion"
            ],
          ),
        ],
      ),
    );
  }
}
