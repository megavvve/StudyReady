import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_add_answer/inherit_for_question_and_answers.dart';

class AddQuestionButton extends StatelessWidget {
  const AddQuestionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
                Color.fromRGBO(119, 165, 245, 1)),
            fixedSize: MaterialStatePropertyAll(Size(305.w, 50.h))),
        onPressed: () {
          QuestionControllers? controllers = QuestionControllers.of(context);
          print(controllers?.answerController1.text);
        },
        child: Text(
          'Добавить вопрос',
          style: TextStyle(color: Colors.black, fontSize: 20.sp),
        ));
  }
}
