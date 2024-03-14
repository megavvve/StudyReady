import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_colors.dart';

class SliverAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      pinned: true,
      backgroundColor: backgroundColor,
      leading: Padding(
        padding: EdgeInsets.only(
          left: 10.w,
        ),
        child: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            Icons.menu,
            size: 30.sp,
          ),
        ),
      ),
      titleSpacing: 33.w,
      title: Container(
        width: 273.w,
        height: 32.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 184, 211, 255),
            borderRadius: BorderRadius.circular(10.sp)),
        child: Text(
          'Новый вопрос',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
