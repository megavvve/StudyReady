import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/add_answer_screen/widgets/add_question_button.dart';
import 'package:study_ready/presentation/pages/add_answer_screen/widgets/first_widget.dart';
import 'package:study_ready/presentation/pages/add_answer_screen/widgets/fourth_widget.dart';
import 'package:study_ready/presentation/pages/add_answer_screen/widgets/option_button.dart';
import 'package:study_ready/presentation/pages/add_answer_screen/widgets/second_widget.dart';
import 'package:study_ready/presentation/pages/add_answer_screen/widgets/third_widget.dart';
import 'package:study_ready/utils/app_colors.dart';

class AddAnswerScreen extends StatefulWidget {
  const AddAnswerScreen({super.key});

  @override
  State<AddAnswerScreen> createState() => _AddAnswerScreenState();
}

class _AddAnswerScreenState extends State<AddAnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            Icons.menu,
            size: 40.sp,
          ),
        ),
        title: Container(
          alignment: Alignment.center,
          width: 278.w,
          height: 46.h,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(119, 165, 245, 1),
              borderRadius: BorderRadius.circular(50)),
          child: const Text('Новый вопрос'),
        ),
      ),
      body: Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const FirstWidget(), // Два прямоугольника(Название вопроса и правильный ответ)
              SizedBox(
                height: 80.h,
              ),
              Column(
                children: [
                  const SecondWidget(), // Прямоугольник 2 (Введите ответ)
                  SizedBox(
                    height: 20.h,
                  ),
                  const ThirdWidget(), //Прямоугольник 3 (Введите ответ)
                  SizedBox(
                    height: 20.h,
                  ),
                  const FourthWidget(), //Прямоугольник 4 (Введите ответ)
                  SizedBox(
                    height: 50.h,
                  ),
                  const OptionsButton(), //кнопка параметры
                  SizedBox(
                    height: 20.h,
                  ),
                  const AddQuestionButton(), // кнопка добавить вопрос
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
