import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigContainer extends StatelessWidget {
  const BigContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275.w,
      height: 64.h,
      decoration: BoxDecoration(
        color: const Color(0xFFD8E2FF),
        borderRadius: BorderRadius.all(
          Radius.circular(16.sp),
        ),
      ),
    );
  }
}
