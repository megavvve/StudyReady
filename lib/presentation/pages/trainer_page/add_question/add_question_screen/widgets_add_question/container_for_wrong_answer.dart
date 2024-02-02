import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/inherit_for_question_and_answers.dart';

class ContainerForWrongAnswer extends StatelessWidget {
  final int index;
  const ContainerForWrongAnswer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    QuestionControllers? controllers = QuestionControllers.of(context);
    List<TextEditingController> listOfWrongAnswerControllers = [
      controllers.answerController2,
      controllers.answerController3,
      controllers.answerController4,
    ];
    return Container(
      padding: EdgeInsets.all(8.sp),
      alignment: Alignment.centerLeft,
      width: 309.w,
      height: 70.h,
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
            width: 30.w,
            height: 34.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                8.sp,
              ),
            ),
            child: Text(
              (index+2).toString(),
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: listOfWrongAnswerControllers[index],
              minLines: 1,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  contentPadding: EdgeInsetsDirectional.only(start: 8.w),
                  isCollapsed: true,
                  border:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Введите неправильный ответ...',
                  hintMaxLines: 1,
                  hintStyle: TextStyle(
                    fontSize: 18.sp,
                  )),
              style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
