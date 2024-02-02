import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/inherit_for_question_and_answers.dart';

class QuestionAndRightAnswerWidget extends StatelessWidget {
  const QuestionAndRightAnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionControllers? controllers = QuestionControllers.of(context);
    return Column(
      children: [
        //белая карточка с названием вопроса
        Container(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 13.w),
            alignment: Alignment.topLeft,
            width: 320.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.sp),
            ),
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: controllers.questionController,
              maxLines: null,
              decoration: InputDecoration(
                  contentPadding: EdgeInsetsDirectional.only(start: 1.w),
                  isCollapsed: true,
                  border:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Введите формулировку вопроса...',
                  hintMaxLines: 2,
                  helperMaxLines: 1,
                  hintStyle: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  )),
              style: TextStyle(
                fontSize: 18.sp,
              ),
            )),
        //белая карточка с названием вопроса
        SizedBox(
          height: 10.h,
        ),
        //зеленая карточка введите правильный ответ
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 13.w),
          alignment: Alignment.center,
          width: 309.w,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(204, 245, 203, 1),
            borderRadius: BorderRadius.circular(
              16.sp,
            ),
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    8.sp,
                  ),
                ),
                child: Text('1', style: TextStyle(fontSize: 18.sp)),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(6.sp),
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    controller: controllers.answerController1,
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsetsDirectional.only(start: 5.w),
                        isCollapsed: true,
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: 'Введите правильный ответ...',
                        hintMaxLines: 2,
                        hintStyle: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        )),
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        //зеленая карточка введите правильный ответ
      ],
    );
  }
}
