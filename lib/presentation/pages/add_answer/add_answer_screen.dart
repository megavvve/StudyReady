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

class AddAnswerScreen extends StatelessWidget {
  const AddAnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const AppBarWidget(),
        SliverToBoxAdapter(
          child: Container(
            height: 16.h,
            color: backgroundColor,
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              color: backgroundColor,
              child: Column(
                children: [
                  const FirstWidget(), // Два прямоугольника(Название вопроса и правильный ответ)
                  SizedBox(
                    height: 65.h,
                  ),
                  const SecondWidget(), // Прямоугольник 2 (Введите ответ)
                  SizedBox(
                    height: 10.h,
                  ),
                  const ThirdWidget(), //Прямоугольник 3 (Введите ответ)
                  SizedBox(
                    height: 10.h,
                  ),
                  const FourthWidget(), //Прямоугольник 4 (Введите ответ)
                  SizedBox(
                    height: 40.h,
                  ),
                  const OptionsButton(), //кнопка параметры
                  SizedBox(
                    height: 10.h,
                  ),
                  const AddQuestionButton(),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            );
          },
          childCount: 1,
        ))
      ],
    ));
  }
}
