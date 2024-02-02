import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/navigation/burger_navigation_leading.dart';
import 'package:study_ready/utils/app_colors.dart';

class AppBarAddingQuestion extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarAddingQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      floating: false,
      pinned: true,
      snap: false,
      shadowColor: Colors.transparent,
      backgroundColor: backgroundColor,
      leading: BurgerNavigationLeading(context),
      title: Row(
        children: [
          SizedBox(width: 10.w,),
          Container(
            height: 35.h,
            width: 250.w,
            alignment: Alignment.center,
            color: secondColor,
            // decoration: BoxDecoration(
            //   color: const Color(0XFF77A5F5),
            //   borderRadius: BorderRadius.circular(16.sp),
            // ),
            child: Text(
              'Новый вопрос',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
