import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/question.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/trainer_page/train_process_screen/widget/answers.dart';
import 'package:study_ready/utils/app_colors.dart';

import 'inherited_widget_check.dart';

class AnswersAndQuestion extends StatefulWidget {
  final Trainer trainer;
  const AnswersAndQuestion({Key? key, required this.trainer}) : super(key: key);

  @override
  State<AnswersAndQuestion> createState() => _AnswersAndQuestionState();
}

class _AnswersAndQuestionState extends State<AnswersAndQuestion> {
  @override
  Widget build(BuildContext context) {
    int selectedQuestion = SharedState.of(context).selectedQuestion;
    final brightness = context.watch<ThemeCubit>().state.brightness;
    Trainer trainer = widget.trainer;
    final List<Question> questionList = trainer.questions;
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        if (state is TrainerLoadSuccess) {
          final answers = state.currentTrainersAnswers[
              (selectedQuestion > questionList.length)
                  ? 1
                  : selectedQuestion - 1];
          return Padding(
            padding: EdgeInsets.all(17.0.sp),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    color: brightness == Brightness.dark
                        ? colorForMaterialCardDark
                        : Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(14.sp),
                    ),
                  ),
                  width: 335.w,
                  child: Center(
                    child: Text(
                      questionList[(selectedQuestion > questionList.length)
                              ? 1
                              : selectedQuestion - 1]
                          .questionContext,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        height: 1.5.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Answers(list: answers),
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator(); // Placeholder for loading state
        }
      },
    );
  }
}
