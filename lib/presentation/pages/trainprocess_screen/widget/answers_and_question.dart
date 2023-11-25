import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/widget/answers.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/widget/process_widget.dart';

import 'InheritedWidgetCheck.dart';

class AnswersAndQuestion extends StatefulWidget {

  const AnswersAndQuestion({super.key});

  static Object? of(BuildContext context, {bool rebuild = true}) {
    if (rebuild) {
      return context.dependOnInheritedWidgetOfExactType<InheritedWidgetDemo>()?.selectedAnswer;

    }
    return context.findAncestorWidgetOfExactType<InheritedWidgetDemo>()?.selectedAnswer;
  }

  @override
  State<AnswersAndQuestion> createState() => _AnswersAndQuestionState();
}

class _AnswersAndQuestionState extends State<AnswersAndQuestion> {
  @override
  Widget build(BuildContext context) {
    var data = InheritedWidgetDemo.of(context);
    print(data?.selectedAnswer);
    return Padding(
        padding: EdgeInsets.all(17.0.sp),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.sp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(14.sp))),
              width: 335.w,
              child: Center(
                  child: Text('${data?.selectedAnswer}')),
            ),
            SizedBox(height: 32.h),
            const Answers(
              list: [
                "1.Ф ТекТекстТекстТекстст",
                "2. ТекТекстТекстТекстст",
                "3. ТекТекстТекстТе",
                "4. ТекТекстТекстТесктТескстТекстст"
              ],
              correctAnswer: 1,
            ),
          ],
        ),

    );
  }
}
