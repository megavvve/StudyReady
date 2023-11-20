import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_add_answer/add_question_button.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_add_answer/app_bar_1.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_add_answer/first_widget.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_add_answer/fourth_widget.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_add_answer/option_button.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_add_answer/second_widget.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_add_answer/third_widget.dart';
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
      appBar: const AppBarWidget(),
      body: Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      const FirstWidget(), // Два прямоугольника(Название вопроса и правильный ответ)
                      SizedBox(
                        height: 80.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                  );
                },
                childCount: 1,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
