import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_screen/trainer_screen.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/widget/answers.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/widget/process_widget.dart';
import 'InheritedWidgetCheck.dart';

class CheckButton extends StatefulWidget {
  const CheckButton({super.key});

  @override
  _CheckButtonState createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    int selectedQuestion = SharedState.of(context).selectedQuestion;
    int selectedIndex = SharedState.of(context).selectedIndex;
    int howmuchQuestion = SharedState.of(context).howmuchQuestion;
    return GestureDetector(
      onTap: () {
        setState(() {
          if([0,1,2,3].contains(selectedIndex)) { // если мы выбрали вопрос
          //  isChecked = !isChecked;

          String resultText = '';
          Color resultColor;

          int correctAnswer = 1;
          // Берем из бд правильный номер ответа(0,1,2,3) по selectedQuestion и selectedIndex
          if (selectedIndex == correctAnswer) {
            resultText = 'Правильно';
            resultColor = Colors.greenAccent;
            // правильно
          } else {
            resultText = 'Неправильно';
            resultColor = Colors.redAccent;
            // неправльно
          }



          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: resultColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Вы ответили $resultText',
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      /*
                      ElevatedButton(
                        child: const Text(
                          'Следующий вопрос',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          setState(() {

                          });


                          Navigator.pop(context);
                        },
                      ),*/
                    ],
                  ),
                ),
              );
            },
          );

          selectedQuestion++;
          // если больше вопросов чем всего есть, то конец тренажора
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
          SharedState.of(context).updateselectedQuestion(selectedQuestion);
          }


        });
      },
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16.sp),
        ),
        width: 335.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 8.w),
            Text(
              !isChecked ? 'Проверка' : 'Продолжить',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
