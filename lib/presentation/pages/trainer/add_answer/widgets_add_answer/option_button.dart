import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer/add_answer/answer_parametrs_sreen.dart';

class OptionsButton extends StatelessWidget {
  const OptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(side: const BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(16))),
          fixedSize: MaterialStatePropertyAll(Size(304.w, 57.h)),
          backgroundColor: const MaterialStatePropertyAll(Colors.white)),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AnsParsScreen()));
      },
      clipBehavior: Clip.none,
      child: Row(
        children: [
          Icon(
            Icons.settings,
            size: 40.sp,
            color: Colors.black,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            'Параметры',
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
          )
        ],
      ),
    );
  }
}
