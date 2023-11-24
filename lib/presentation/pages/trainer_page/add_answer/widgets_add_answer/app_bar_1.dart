import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Icon(
          Icons.menu,
          size: 40.sp,
        ),
      ),
      title: Container(
        alignment: Alignment.center,
        width: 278.w,
        height: 46.h,
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(119, 165, 245, 1),
            borderRadius: BorderRadius.circular(50)),
        child: const Text('Новый вопрос'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
