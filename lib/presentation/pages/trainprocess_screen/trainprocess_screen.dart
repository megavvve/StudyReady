import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/widget/InheritedWidgetCheck.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/widget/answers_and_question.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/widget/check_button.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/widget/process_widget.dart';

import 'package:study_ready/utils/app_svg_assets.dart';
import '../../../utils/app_colors.dart';
import 'widget/question_buttons.dart';

class TrainProcessScreen extends StatefulWidget {
  const TrainProcessScreen({super.key});

  @override
  State<TrainProcessScreen> createState() => _TrainProcessScreenState();
}

/*Widget getTextWidgets(List<String> strings) {
  List<Widget> list = <Widget>[];
  for (var i = 0; i < strings.length; i++) {
    list.add(QuestionButtons(
      id: i,
      label: strings[i],
      color: colorForCardTrainerBlue,
    ));
  }
  return Row(children: list);
}*/

class _TrainProcessScreenState extends State<TrainProcessScreen> {
  List<Widget> list = <Widget>[];
  int _selectedIndex = 0;
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
    var numberOfQuestions = 8; // Напиши сюда количество вопрсов
    var questions = <String>[];
    for (var i = 1; i <= numberOfQuestions; i++) {
      questions.add('$i');
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Stack(
          children: [
            Text('Непрерывная математика'),
          ],
        ),
      ),
      body: SharedState(
        selectedIndex: _selectedIndex,
        updateSelectedIndex: _updateSelectedIndex,

        selectedQuestion: _selectedQuestion,
        updateselectedQuestion: _updateSelectedQuestion,
        howmuchQuestion: 8,
        //берем из бд сколько у нас всего вопросов в этом тренажоре
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Stack(
              children: [
                ProcessWidget(
                  child: Column(
                    children: [

                      //LinearProgressIndicator(value: ,),
                      /*
                      Row(children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            //child: getTextWidgets(questions),
                            child: LinearProgressIndicator(value: _selectedQuestion.toDouble(),),
                          ),
                        ),
                      ]),*/
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const AnswersAndQuestion(),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(height: 60.h),
                          const CheckButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
