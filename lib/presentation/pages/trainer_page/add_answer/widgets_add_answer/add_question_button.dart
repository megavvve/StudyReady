import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_answer/widgets_add_answer/inherit_for_question_and_answers.dart';

class AddQuestionButton extends StatelessWidget {
  const AddQuestionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              side: const BorderSide(color: Color.fromARGB(255, 69, 139, 255)),
              borderRadius: BorderRadius.circular(16.sp),
            ),
          ),
          backgroundColor:
              const MaterialStatePropertyAll(Color.fromARGB(255, 69, 139, 255)),
          fixedSize: MaterialStatePropertyAll(
            Size(327.w, 59.h),
          ),
        ),
        onPressed: () {
          QuestionControllers? controllers = QuestionControllers.of(context);
          print(controllers?.answerController1.text);
        },
        child: Text(
          'Создать тренажер',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
          ),
        ));
  }
}
