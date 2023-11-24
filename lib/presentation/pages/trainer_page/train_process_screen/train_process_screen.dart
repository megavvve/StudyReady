import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/models/trainer.dart';
import 'package:study_ready/presentation/pages/trainer_page/train_process_screen/widget/process_widget.dart';
import 'widget/question_buttons.dart';

class TrainProcessScreen extends StatefulWidget {
  final Trainer trainer;
  const TrainProcessScreen({super.key, required this.trainer});

  @override
  State<TrainProcessScreen> createState() => _TrainProcessScreenState();
}

Widget getTextWidgets(List<String> strings) {
  List<Widget> list = <Widget>[];
  for (var i = 0; i < strings.length; i++) {
    list.add(QuestionButtons(id: i, label: strings[i]));
  }
  return Row(children: list);
}

class _TrainProcessScreenState extends State<TrainProcessScreen> {
  List<Widget> list = <Widget>[];
  //Trainer tr = widget.trainer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Непрерывная математика",
        ),
      ),
      body: ProcessWidget(
        child: Row(children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: getTextWidgets(['1', '2', '3', '4', '5', '6', '7', '8']),
            ),
          ),
          const ShowWidget(),
        ]),
      ),
    );
  }
}
