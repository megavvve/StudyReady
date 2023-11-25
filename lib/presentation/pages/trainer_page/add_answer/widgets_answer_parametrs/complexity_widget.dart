import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_answer_parametrs/inherit_for_question_param.dart';

class ComplexityWidget extends StatefulWidget {
  const ComplexityWidget({Key? key}) : super(key: key);

  @override
  State<ComplexityWidget> createState() => _ComplexityWidgetState();
}

class _ComplexityWidgetState extends State<ComplexityWidget> {
  @override
  Widget build(BuildContext context) {
    QuestionAndAnswersControllers? controllers =
        QuestionAndAnswersControllers.of(context);
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(16.sp,),
          alignment: Alignment.topLeft,
          width: 321.w,
          height: 116.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16.sp)),
          child: Text(
            'Сложность',
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
                borderRadius: BorderRadius.circular(16.sp)),
            child: DropdownButtonFormField<String>(
              value: controllers?.difficultController.text,
              
              items: ['easy', 'middle', 'hard'].map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  controllers?.difficultController.text = newValue ?? '';
                });
              },
              decoration: InputDecoration(
                isDense: false,
                isCollapsed: true,
                contentPadding: EdgeInsetsDirectional.only(start: 8.w),
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Выберите сложность...',
                hintMaxLines: 2,
                hintStyle: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              style: TextStyle(fontSize: 20.sp,color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
