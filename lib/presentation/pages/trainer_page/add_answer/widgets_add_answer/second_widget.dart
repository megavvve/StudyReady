import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_answer/widgets_add_answer/inherit_for_question_and_answers.dart';

class SecondWidget extends StatelessWidget {
  const SecondWidget({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionControllers? controllers = QuestionControllers.of(context);
    return Container(
      padding: EdgeInsets.all(8.sp),
      alignment: Alignment.centerLeft,
      width: 309.w,
      height: 113.h,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(198, 216, 245, 1),
        borderRadius: BorderRadius.circular(
          16.sp,
        ),
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 39.w,
            height: 34.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.sp)),
            child: Text('2', style: TextStyle(fontSize: 18.sp)),
          ),
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: controllers.answerController2,
              minLines: 1,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  contentPadding: EdgeInsetsDirectional.only(start: 8.w),
                  isCollapsed: true,
                  border:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Введите неправильный ответ...',
                  hintMaxLines: 2,
                  hintStyle: TextStyle(
                    fontSize: 18.sp,
                  )),
              style: TextStyle(fontSize: 18.sp),
            ),
          )
        ],
      ),
    );
  }
}
