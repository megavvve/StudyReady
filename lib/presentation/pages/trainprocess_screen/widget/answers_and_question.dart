import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/widget/answers.dart';

class AnswersAndQuestion extends StatefulWidget {
  const AnswersAndQuestion({super.key});

  @override
  State<AnswersAndQuestion> createState() => _AnswersAndQuestionState();
}

class _AnswersAndQuestionState extends State<AnswersAndQuestion> {
  @override
  Widget build(BuildContext context) {
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
            child: const Center(child: Text("Вопрос такой то такой то")),
          ),
          SizedBox(height: 32.h),
          const Answers(list: ["1. ТекТекстТекстТекстст","2. ТекТекстТекстТекстст","3. ТекТекстТекстТе","4. ТекТекстТекстТесктТескстТекстст"],),
        ],
      ),
    );
  }
}
