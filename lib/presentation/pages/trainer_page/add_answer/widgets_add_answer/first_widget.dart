import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_answer/widgets_add_answer/inherit_for_question_and_answers.dart';

class FirstWidget extends StatelessWidget {
  const FirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionControllers? controllers = QuestionControllers.of(context);
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        //белая карточка с названием вопроса
        Container(
            padding: EdgeInsets.all(16.sp),
            alignment: Alignment.topLeft,
            width: 321.w,
            height: 116.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16.sp)),
            child: TextField(
              controller: controllers.questionController,
              decoration: InputDecoration(
                  border:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Название вопроса...',
                  hintStyle: TextStyle(
                    fontSize: 20.sp,
                  )),
              style: TextStyle(fontSize: 20.sp),
            )),
        //белая карточка с названием вопроса

        //зеленая карточка введите правильный ответ
        Positioned(
          top: 60.sp,
          child: Container(
            padding: EdgeInsets.all(8.sp),
            alignment: Alignment.center,
            width: 309.w,
            height: 113.h,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(204, 245, 203, 1),
                borderRadius: BorderRadius.circular(16.sp)),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 39.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.sp)),
                  child: Text('1', style: TextStyle(fontSize: 18.sp)),
                ),
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: controllers.answerController1,
                    minLines: 2,
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsetsDirectional.only(start: 8.w),
                        isCollapsed: true,
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: 'Введите правильный ответ...',
                        hintMaxLines: 2,
                        hintStyle: TextStyle(
                          fontSize: 18.sp,
                        )),
                    style: TextStyle(fontSize: 18.sp),
                  ),
                )
              ],
            ),
          ),
        ),
        //зеленая карточка введите правильный ответ
      ],
    );
  }
}
