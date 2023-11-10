import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainerCard extends StatelessWidget {
  const TrainerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176.43.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.sp),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(
        top: 22.h,
        left: 20.w,
        right: 20.w,
      ),
    );
  }
}
