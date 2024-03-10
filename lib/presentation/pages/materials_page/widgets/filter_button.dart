import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.sp),
              color: secondColor,
            ),
            height: 32.h,
            width: 122.w,
            alignment: Alignment.center,
            child: Text(
              "Фильтр",
              style: TextStyle(color: Colors.black, fontSize: 16.sp),
            ),
          ),
        ),
      ),
    );
  }
}
