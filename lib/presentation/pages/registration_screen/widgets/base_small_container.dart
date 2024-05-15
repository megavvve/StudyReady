import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 127.w,
      height: 33.h,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.all(
          Radius.circular(16.sp),
        ),
      ),
    );
  }
}
