import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_answer/widgets_add_answer/inherit_for_question_and_answers.dart';

class FourthWidget extends StatelessWidget {
  const FourthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionControllers? controllers = QuestionControllers.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(18.sp, 8.sp, 18.sp, 8.sp),
      alignment: Alignment.centerLeft,
      width: 327.w,
      height: 59.h,
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
            width: 29.w,
            height: 25.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5.sp)),
            child: Text(
              '4',
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: controllers?.answerController4,
              minLines: 1,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  contentPadding: EdgeInsetsDirectional.only(start: 8.w),
                  isCollapsed: true,
                  border:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Введите ответ...',
                  hintMaxLines: 2,
                  hintStyle: TextStyle(
                    fontSize: 18.sp,
                    color: const Color.fromRGBO(0, 0, 0, 0.46),
                  )),
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
