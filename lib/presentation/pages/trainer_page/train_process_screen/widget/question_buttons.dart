import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_page/train_process_screen/widget/process_widget.dart';


class QuestionButtons extends StatelessWidget {
  final String label;
  final int id;

  const QuestionButtons({super.key, required this.label, required this.id});

  @override
  Widget build(BuildContext context) {
    ProcessWidgetState data = ProcessWidget.of(context);
    return Container(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 60.w,
        height: 40.w,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0.sp),
              ),
            ),
          ),
          onPressed: () {
            data.setMyMoney(label);
            //Navigator.of(context).push(MaterialPageRoute(
            //    builder: (context) => TrainProcessScreen(buttonName: label)));
          },
          child: Text(
            label,
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
