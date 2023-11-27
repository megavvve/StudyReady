import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_answer/widgets_add_answer/inherit_for_question_and_answers.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_answer/widgets_add_answer/is_empty_text_field.dart';

class AddQuestionButton extends StatelessWidget {
  const AddQuestionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              const MaterialStatePropertyAll(Color.fromRGBO(119, 165, 245, 1)),
          fixedSize: MaterialStatePropertyAll(Size(305.w, 50.h))),
      onPressed: () {
        QuestionControllers? controllers = QuestionControllers.of(context);
        if (isEmptyTextField(controllers)) {
          print("ошибка. Неверный ввод данных");
        } else {
          print("добавлено");
        }
      },
      child: Text(
        'Добавить вопрос',
        style: TextStyle(color: Colors.black, fontSize: 20.sp),
      ),
    );
  }
}
