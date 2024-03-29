import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/question_params/widgets_answer_parametrs/inherit_for_question_param.dart';

class ModuleWidget extends StatelessWidget {
  const ModuleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionAndAnswersControllers? controllers = QuestionAndAnswersControllers.of(context);
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(16.sp),
          alignment: Alignment.topLeft,
          width: 321.w,
          height: 116.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16.sp)),
          child: Text(
            'Модуль',
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
        Positioned(
          top: 63.sp,
          child: Container(
            padding: EdgeInsets.all(8.sp),
            alignment: Alignment.centerLeft,
            width: 309.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(198, 216, 245, 1),
              borderRadius: BorderRadius.circular(16.sp),
            ),
            child: Expanded(
              child: TextField(
                textInputAction: TextInputAction.done,
                controller: controllers?.moduleController,
                keyboardType: TextInputType.text,
                minLines: 1,
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  
                    isDense: false,
                    isCollapsed: true,
                    contentPadding: EdgeInsetsDirectional.only(start: 8.w),
                    border:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Введите модуль...',
                    hintMaxLines: 2,
                    hintStyle: TextStyle(
                      fontSize: 20.sp,
                    )),
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
          ),
        ),
        //зеленая карточка введите правильный ответ
      ],
    );
  }
}
