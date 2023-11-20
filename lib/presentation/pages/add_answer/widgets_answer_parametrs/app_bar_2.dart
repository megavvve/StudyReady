import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_colors.dart';

class AnsParsAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AnsParsAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Container(
        alignment: Alignment.center,
        width: 278.w,
        height: 46.h,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(119, 165, 245, 1),
            borderRadius: BorderRadius.circular(50)),
        child: const Text('Параметры'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
