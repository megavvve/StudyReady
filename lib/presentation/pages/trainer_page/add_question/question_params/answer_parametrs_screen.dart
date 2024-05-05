import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/question_params/widgets_answer_parametrs/card_for_question_param.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/question_params/widgets_answer_parametrs/save_button.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/question_params/widgets_answer_parametrs/sliver_ans_pars_app_bar_widget.dart';
import 'package:study_ready/utils/app_colors.dart';

class AnsParsScreen extends StatelessWidget {
  const AnsParsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final listOfParams = [
      "Предмет",
      "Номер курса",
      "Глава",
      "Тема",
      "Сложность"
    ];
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          const SliverAnsParsAppBarWidget(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40.h,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    CardForQuestionParams(
                      param: listOfParams[index],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                );
              },
              childCount: listOfParams.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: SaveButtonWidget(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.h,
            ),
          ),
        ],
      ),
    );
  }
}
