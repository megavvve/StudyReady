// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:study_ready/domain/models/trainer.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/trainer_screen.dart';
import 'package:study_ready/utils/app_colors.dart';

import 'inherited_widget_check.dart';

class CheckButton extends StatefulWidget {
  final Trainer trainer;
  const CheckButton({
    Key? key,
    required this.trainer,
  }) : super(key: key);

  @override
  _CheckButtonState createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    
    final Trainer trainer = widget.trainer;
    int selectedQuestion = SharedState.of(context).selectedQuestion;
    int selectedIndex = SharedState.of(context).selectedIndex;
    int howmuchQuestion = SharedState.of(context).howmuchQuestion;
    List<String> answerQuestion = SharedState.of(context).answerQuestion;

    void nextQuestion() {
      setState(() {
        selectedQuestion++;
        SharedState.of(context).updateselectedQuestion(selectedQuestion);
        SharedState.of(context).updateSelectedIndex(-1);
      });
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          if ([0, 1, 2, 3].contains(selectedIndex)) {
            // String resultText = '';
            // Color resultColor;
           
            int correctAnswer = 0;
            // // Берем из бд правильный номер ответа(0,1,2,3) по selectedQuestion и selectedIndex
            // if (selectedIndex == correctAnswer) {
            //   resultText = 'Правильно';
            //   resultColor = Colors.greenAccent;

            //   // правильно
            // } else {
            //   resultText = 'Неправильно';
            //   resultColor = Colors.redAccent;
            //   // неправльно
            // }
            bool isCorrect = selectedIndex == correctAnswer;
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                          nextQuestion();
                          if (selectedQuestion > howmuchQuestion) {
                            Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                                transitionDuration: Duration.zero,
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return const TrainerScreen();
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return child;
                                },
                              ),
                            );
                          }
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
              if (selectedQuestion > howmuchQuestion) {
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    transitionDuration: Duration.zero,
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const TrainerScreen();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                  ),
                );
              }
            });

            // если больше вопросов чем всего есть, то конец тренажора
          }
        });
      },
      child: Container(
        padding: EdgeInsets.all(
          16.sp,
        ),
        decoration: (selectedIndex == -1)
            ? BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.circular(
                  16.sp,
                ),
              )
            : BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(
                  16.sp,
                ),
              ),
        width: 335.w,
        height: 60.h,
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
  }
}
