import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_add_answer/add_question_button.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_add_answer/sliver_app_bar_widget.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_add_answer/first_widget.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_add_answer/inherit_for_question_and_answers.dart';

import 'package:study_ready/presentation/pages/add_answer/widgets_add_answer/third_widget.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_answer_parametrs/sliver_ans_pars_app_bar_widget.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_answer/widgets_add_answer/fourth_widget.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_answer/widgets_add_answer/option_button.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_answer/widgets_add_answer/second_widget.dart';
import 'package:study_ready/utils/app_colors.dart';

class AddAnswerScreen extends StatelessWidget {
  const AddAnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          const SliverAppBarWidget(), 
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
                  child: QuestionControllers(
                    child: Column(
                      children: [
                        const FirstWidget(),
                        SizedBox(
                          height: 65.h,
                        ),
                        const SecondWidget(),
                        SizedBox(
                          height: 10.h,
                        ),
                        const ThirdWidget(),
                        SizedBox(
                          height: 10.h,
                        ),
                        const FourthWidget(),
                        SizedBox(
                          height: 10.h,
                        ),
                        const OptionsButton(),
                        SizedBox(
                          height: 15.h,
                        ),
                        const AddQuestionButton(),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
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
