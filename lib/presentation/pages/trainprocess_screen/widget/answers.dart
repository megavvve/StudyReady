import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/widget/process_widget.dart';

import 'InheritedWidgetCheck.dart';

class Answers extends StatefulWidget {
  final List<String> list;
  final int correctAnswer;

  const Answers({super.key, required this.list, required this.correctAnswer});

  @override
  State<Answers> createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  //int selectedButtonIndex = -1;

  @override
  Widget build(BuildContext context) {

    return
     Column(children: [
        for (int i = 0; i < widget.list.length; i++)
          Column(
            children: [
              SizedBox(
                width: 335.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: _buttonStyle(i),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.sp),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0.sp),
                    child: Text(
                      widget.list[i],
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onPressed: () {
                    _onButtonPressed(i);
                  },
                ),
              ),
              SizedBox(
                height: 23.h,
              )
            ],
          ),
      ],
    );
  }

  Color _buttonStyle(int buttonIndex) {
    var data = InheritedWidgetDemo.of(context);
    return (buttonIndex == data?.selectedAnswer)
        ? Colors.grey // Цвет выделенной кнопки
        : Colors.white;
  }

  void _onButtonPressed(int buttonIndex) {
    var data = InheritedWidgetDemo.of(context);
    setState(() {
      data?.selectedAnswer = buttonIndex;
      //print(data?.selectedAnswer);
      //selectedButtonIndex = buttonIndex;
    });
  }
}
