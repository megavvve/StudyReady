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
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    
        
        title: Container(
          alignment: Alignment.center,
          width: 278.w,
          height: 52.h,
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(119, 165, 245, 1),
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Text('Параметры', style: TextStyle(fontSize: 18.sp),),
        ),
     
    );
  }
}
