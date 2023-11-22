import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/widget/OverflowBar_widget.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/widget/process_widget.dart';
import '../../../utils/app_colors.dart';
import 'widget/question_buttons.dart';

class TrainProcessScreen extends StatefulWidget {
  const TrainProcessScreen({super.key});

  @override
  State<TrainProcessScreen> createState() => _TrainProcessScreenState();
}

Widget getTextWidgets(List<String> strings) {
  List<Widget> list = <Widget>[];
  for (var i = 0; i < strings.length; i++) {
    list.add(QuestionButtons(id: i, label: strings[i], color: colorForCardTrainerBlue,));
  }
  return Row(children: list);
}

class _TrainProcessScreenState extends State<TrainProcessScreen> {
  List<Widget> list = <Widget>[];

  @override
  Widget build(BuildContext context) {
    var numberOfQuestions = 8; // Напиши сюда количество вопрсов
    var questions = <String>[];
    for(var i = 1; i <= numberOfQuestions; i++) {
      questions.add('$i');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Непрерывная математика'),
      ),
      body: Stack(
        children: [
          ProcessWidget(
            child: Stack(
              children: [
                Row(children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,

                      child: getTextWidgets(
                         questions),
                    ),
                  ),
                ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ShowWidget(),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const OverflowBarAnswers(),
                    SizedBox(
                      height: 8.h,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
