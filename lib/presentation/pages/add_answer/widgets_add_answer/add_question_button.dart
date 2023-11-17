import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddQuestionButton extends StatelessWidget {
  const AddQuestionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
                Color.fromRGBO(119, 165, 245, 1)),
            fixedSize: MaterialStatePropertyAll(Size(305.w, 69.h))),
        onPressed: () {},
        child: Text(
          'Добавить вопрос',
          style: TextStyle(color: Colors.black, fontSize: 20.sp),
        ));
  }
}
