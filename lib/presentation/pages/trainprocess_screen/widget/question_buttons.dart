import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/trainprocess_screen.dart';
import 'package:study_ready/presentation/pages/trainprocess_screen/widget/process_widget.dart';

import '../../../../utils/app_colors.dart';

class QuestionButtons extends StatelessWidget {
  final String label;
  final int id;
  Color color;

  QuestionButtons({super.key, required this.label, required this.id, required this.color});

  @override
  Widget build(BuildContext context) {
    ProcessWidgetState data = ProcessWidget.of(context);
    return Container(
        alignment: Alignment.topCenter,
        child: Row(
          children: [
            SizedBox(
              height: 40.00.h,
              width: 55.00.w,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(color),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                     RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  data.setMyQuestion(label);
                  color = data.color;
                  data.setColor(colorForCardTrainerBlue);
                },
                //child: Padding(
                //   padding: EdgeInsets.all(50.0),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            //),
            SizedBox(
              width: 5.w,
            ),
          ],
        ));
  }
}
