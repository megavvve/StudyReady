import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_colors.dart';

class SliverAnsParsAppBarWidget extends StatelessWidget {
  const SliverAnsParsAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      surfaceTintColor: Colors.transparent,
      backgroundColor: backgroundColor,
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30.sp,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: Container(
        alignment: Alignment.center,
        width: 298.w,
        height: 32.h,
        padding: EdgeInsets.all(5.sp),
        decoration: BoxDecoration(
          color: const Color(0xFFB8D3FF),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: Text(
          'Параметры тренажера',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
