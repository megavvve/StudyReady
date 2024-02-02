import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/widgets/burger_navigation_leading.dart';
import 'package:study_ready/utils/app_colors.dart';

class AppBarAddingQuestion extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAddingQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
       floating: false,
        pinned: true, snap: false,
        shadowColor: Colors.transparent,
      backgroundColor: backgroundColor,
      leading:BurgerNavigationLeading(context), 
      title: Container(
        width: 278.w,
        height: 46.h,
        alignment: Alignment.center,
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
