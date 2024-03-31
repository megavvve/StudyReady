import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/add_question_button.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/question_and_right_answer_widget.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/option_button.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/container_for_wrong_answer.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/widgets_add_question/app_bar_adding_question.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/question_params/widgets_answer_parametrs/card_for_question_param.dart';
import 'package:study_ready/utils/app_colors.dart';

class AddQustionScreen extends StatelessWidget {
  const AddQustionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigatorDrawer(),
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          const AppBarAddingQuestion(),
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
                      SizedBox(
                        height: 10.h,
                      ),
                      const QuestionAndRightAnswerWidget(),
                      SizedBox(
                        height: 40.h,
                      ),
                      Column(
                        children: List.generate(
                          3,
                          (index) => Column(
                            children: [
                              ContainerForWrongAnswer(
                                index: index,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const CardForQuestionParams(
                        param: "Добавить в тренажер:",
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const OptionsButton(),
                      SizedBox(
                        height: 40.h,
                      ),
                      const AddQuestionButton(),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
