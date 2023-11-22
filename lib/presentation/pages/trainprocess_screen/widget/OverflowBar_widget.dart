import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/widget/process_widget.dart';

import '../../../../utils/app_colors.dart';

class OverflowBarAnswers extends StatelessWidget {
  const OverflowBarAnswers({super.key});

  @override
  Widget build(BuildContext context) {
    int answerTrue = 1; // Введи правильный ответ

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16.w),
      child: Material(
        color: splashBackGroundColor,
        elevation: 24,
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: OverflowBar(
                    spacing: 10,
                    overflowAlignment: OverflowBarAlignment.start,
                    children: <Widget>[
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              colorForCardTrainerBlue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          '1. ТекстТекстТекстТестТекстТекстТекст',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          ProcessWidgetState data = ProcessWidget.of(context);
                          if (answerTrue == 1) {
                            data.setColor(Colors.greenAccent); // НЕ РАБОТАЕТ
                          } else {
                            data.setColor(Colors.redAccent); // НЕ РАБОТАЕТ
                          }
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              colorForCardTrainerBlue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          '2. ТекТекстТекстТекстст',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          ProcessWidgetState data = ProcessWidget.of(context);
                          if (answerTrue == 2) {
                            data.setColor(Colors.greenAccent); // НЕ РАБОТАЕТ
                          } else {
                            data.setColor(Colors.redAccent); // НЕ РАБОТАЕТ
                          }
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              colorForCardTrainerBlue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          '3. Текст',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          ProcessWidgetState data = ProcessWidget.of(context);
                          if (answerTrue == 3) {
                            data.setColor(Colors.greenAccent); // НЕ РАБОТАЕТ
                          } else {
                            data.setColor(Colors.redAccent); // НЕ РАБОТАЕТ
                          }
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              colorForCardTrainerBlue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          '4. Текст',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          ProcessWidgetState data = ProcessWidget.of(context);
                          if (answerTrue == 4) {
                            data.setColor(Colors.greenAccent); // НЕ РАБОТАЕТ
                          } else {
                            data.setColor(Colors.redAccent); // НЕ РАБОТАЕТ
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
