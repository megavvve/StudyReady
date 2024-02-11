// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/pages/trainer_page/train_process_screen/widget/answers_and_question.dart';
import 'package:study_ready/presentation/pages/trainer_page/train_process_screen/widget/check_button.dart';
import 'package:study_ready/presentation/pages/trainer_page/train_process_screen/widget/confirmation_dialog.dart';
import 'package:study_ready/presentation/pages/trainer_page/train_process_screen/widget/inherited_widget_check.dart';
import 'package:study_ready/presentation/pages/trainer_page/train_process_screen/widget/process_widget.dart';
import '../../../../utils/app_colors.dart';

class TrainProcessScreen extends StatefulWidget {
  final Trainer trainer;
  const TrainProcessScreen({super.key, required this.trainer});

  @override
  State<TrainProcessScreen> createState() => _TrainProcessScreenState();
}

class _TrainProcessScreenState extends State<TrainProcessScreen> {
  List<Widget> list = <Widget>[];
  int _selectedIndex = -1;
  int _selectedQuestion = 1;

  void _updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateSelectedQuestion(int question) {
    setState(() {
      _selectedQuestion = question;
    });
  }

  @override
  Widget build(BuildContext context) {
    Trainer trainer = widget.trainer;

    int numberOfQuestions = trainer.questions.length;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: WillPopScope(
        onWillPop: () async {
          final result = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return const ConfirmationDialog();
            },
          );

          if (result != null && result) {
            Navigator.pop(context);
            Navigator.pop(context);
            return true;
          } else {
            return false;
          }
        },
        child: SharedState(
          selectedIndex: _selectedIndex,
          updateSelectedIndex: _updateSelectedIndex,
          selectedQuestion: _selectedQuestion,
          updateselectedQuestion: _updateSelectedQuestion,
          howmuchQuestion: numberOfQuestions,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                snap: true,
                floating: true,
                surfaceTintColor: Colors.transparent,
                collapsedHeight: 80.h,
                backgroundColor: backgroundColor,
                leading: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const ConfirmationDialog();
                      },
                    );

                    if (result != null && result) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  },
                ),
                title: Column(
                  children: [
                    Text(
                      'Непрерывная математика',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ],
                ),
                flexibleSpace: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                    child: SizedBox(
                      height: 15.h,
                      width: 350.w,
                      child: LinearProgressIndicator(
                        value: (_selectedQuestion.toDouble() - 1) /
                            numberOfQuestions.toDouble(),
                        valueColor: AlwaysStoppedAnimation<Color>(mainColor),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Stack(
                    children: [
                      ProcessWidget(
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AnswersAndQuestion(
                                  trainer: trainer,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                SizedBox(height: 30.h),
                                CheckButton(
                                  trainer: trainer,
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
