import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_answer_parametrs/app_bar_2.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_answer_parametrs/complexity_widget.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_answer_parametrs/module_widget.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_answer_parametrs/number_of_course_widget.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_answer_parametrs/save_button.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_answer_parametrs/subject_widget.dart';
import 'package:study_ready/presentation/pages/add_answer/widgets_answer_parametrs/theme_widget.dart';
import 'package:study_ready/utils/app_colors.dart';

class AnsParsScreen extends StatelessWidget {
  const AnsParsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          const AnsParsAppBarWidget(),
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
                      const SubjectWidget(),
                      SizedBox(
                        height: 75.h,
                      ),
                      const CourseNumberWidget(),
                      SizedBox(
                        height: 75.h,
                      ),
                      const ModuleWidget(),
                      SizedBox(
                        height: 75.h,
                      ),
                      const ThemeWidget(),
                      SizedBox(
                        height: 75.h,
                      ),
                      const ComplexityWidget(),
                      SizedBox(
                        height: 75.h,
                      ),
                      const SaveButtonWidget(),
                       SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
