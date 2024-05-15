import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreetingsField extends StatelessWidget {
  const GreetingsField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 204.w,
      height: 95.h,
      child: Text(
        "Добро\nпожаловать",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 33.sp),
      ),
    );
  }
}
