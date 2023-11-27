import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_colors.dart';

class SliverAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      pinned: true,
      backgroundColor: backgroundColor,
      
      leading: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Icon(
          Icons.menu,
          size: 40.sp,
        ),
      ),
      
      title: Container(
        width: 278.w,
        height: 46.h,
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            color: const Color(0XFF77A5F5),
            borderRadius: BorderRadius.circular(16.sp)),
        child: Text(
          'Новый вопрос',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
