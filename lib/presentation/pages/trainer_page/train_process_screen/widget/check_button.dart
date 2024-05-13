import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/pages/trainer_page/train_process_screen/widget/train_result_screen.dart';

import 'package:study_ready/utils/app_colors.dart';

import 'inherited_widget_check.dart';

class CheckButton extends StatefulWidget {
  final Trainer trainer;
  const CheckButton({
    Key? key,
    required this.trainer,
  }) : super(key: key);

  @override
  CheckButtonState createState() => CheckButtonState();
}

class CheckButtonState extends State<CheckButton> {
  bool isChecked = false;
  int correctAnswers = 0;
  @override
  Widget build(BuildContext context) {
    int selectedQuestion = SharedState.of(context).selectedQuestion;
    int selectedIndex = SharedState.of(context).selectedIndex;
    int howmuchQuestion = SharedState.of(context).howmuchQuestion;
    void nextQuestionIndex() {
      setState(() {
        selectedQuestion++;
        SharedState.of(context).updateselectedQuestion(selectedQuestion);

        SharedState.of(context).updateSelectedIndex(-1);
      });
    }

    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        final brightness = context.watch<ThemeCubit>().state.brightness;
        if (state is TrainerLoadSuccess) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if ([0, 1, 2, 3].contains(selectedIndex)) {
                  int correctAnswer = 0;
                  for (var i = 0;
                      i <
                          state.currentTrainersAnswers[selectedQuestion - 1]
                              .length;
                      i++) {
                    if (widget.trainer.questions[selectedQuestion - 1]
                            .rightAnswer ==
                        state.currentTrainersAnswers[selectedQuestion - 1][i]) {
                      correctAnswer = i;
                    }
                  }
                  bool isCorrect = selectedIndex == correctAnswer;
                  correctAnswers += isCorrect ? 1 : 0;
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                          color: brightness == Brightness.dark
                              ? backgroundColorDark
                              : Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.sp),
                            topRight: Radius.circular(16.sp),
                          ),
                        ),
                        padding: EdgeInsets.all(15.sp),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              isCorrect ? 'Правильно!' : 'Неправильно',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: isCorrect ? Colors.green : Colors.red,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              isCorrect
                                  ? 'Отличная работа! Продолжайте в том же духе!'
                                  : 'Попробуйте еще раз. У вас получится!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: isCorrect ? Colors.green : Colors.red,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    isCorrect ? Colors.green : Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.sp),
                                ),
                              ),
                              child: Text(
                                'Следующий вопрос',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).whenComplete(() {
                    if (selectedQuestion >= howmuchQuestion) {
                      Navigator.of(context).pushReplacement(
                        customPageRoute(
                          TrainingResultScreen(
                            correctAnswers: correctAnswers,
                            totalQuestions: howmuchQuestion,
                            randomResultingText: getRandomCongratulations(),
                          ),
                        ),
                      );
                    } else {
                      nextQuestionIndex();
                    }
                  });
                }
              });
            },
            child: Container(
              padding: EdgeInsets.all(
                16.sp,
              ),
              decoration: (selectedIndex == -1)
                  ? BoxDecoration(
                      color: brightness == Brightness.dark
                          ? secondColorDark
                          : secondColorLight,
                      borderRadius: BorderRadius.circular(
                        16.sp,
                      ),
                    )
                  : BoxDecoration(
                      color: brightness == Brightness.dark
                          ? mainColorDark
                          : mainColorLight,
                      borderRadius: BorderRadius.circular(
                        16.sp,
                      ),
                    ),
              width: 335.w,
              height: 70.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 8.w),
                  Text(
                    !isChecked ? 'Проверка' : 'Продолжить',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp),
                  ),
                ],
              ),
            ),
          );
        } else {
          // Handle loading or failure states
          return const CircularProgressIndicator(); // Placeholder for loading state
        }
      },
    );
  }

  String getRandomCongratulations() {
    final List<String> congratulationsList = [
      "Поздравляем! Вы успешно завершили тренажер. Продолжайте развиваться в выбранной области!",
      "Отличная работа! Теперь у вас ещё больше знаний в вашем арсенале. Применяйте их с уверенностью!",
      "Вы завершили тренажер. Не забывайте, что каждый вопрос - шаг к вашему успеху!",
      "Браво! Теперь вы стали на шаг ближе к мастерству в этой области. Продолжайте в том же духе!",
      "Тренажер пройден успешно! Ваши усилия приносят результаты. Уверены, что вы готовы к новым вызовам!",
    ];

    final random = Random();
    final randomIndex = random.nextInt(congratulationsList.length);

    return congratulationsList[randomIndex];
  }
}
