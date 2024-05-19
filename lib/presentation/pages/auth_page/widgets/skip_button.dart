import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/home_page/home_screen.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: 127.w,
        height: 33.h,
        decoration: BoxDecoration(
          color: const Color(0xFFF8BBBB),
          borderRadius: BorderRadius.all(
            Radius.circular(16.sp),
          ),
        ),
        child: Text(
          "Пропустить",
          style: TextStyle(color: const Color(0xFFB32727), fontSize: 17.sp),
        ),
      ),
    );
  }
}
