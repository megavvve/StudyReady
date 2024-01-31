import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/widgets_add_question/add_question_button.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/widgets_add_question/first_widget.dart';

import 'package:study_ready/presentation/pages/trainer_page/add_question/widgets_add_question/fourth_widget.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/widgets_add_question/inherit_for_question_and_answers.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/widgets_add_question/option_button.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/widgets_add_question/second_widget.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/widgets_add_question/sliver_app_bar_widget.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/widgets_add_question/third_widget.dart';
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
                          height: 85.h,
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
