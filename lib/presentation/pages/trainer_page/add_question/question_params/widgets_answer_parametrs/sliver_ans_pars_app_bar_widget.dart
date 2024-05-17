import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/utils/app_colors.dart';

class SliverAnsParsAppBarWidget extends StatelessWidget {
  const SliverAnsParsAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return SliverAppBar(
      pinned: true,
      surfaceTintColor: Colors.transparent,
      backgroundColor: brightness == Brightness.dark
          ? backgroundColorDark
          : backgroundColorLight,
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
        width: 298.w,
        height: 32.h,
        padding: EdgeInsets.all(5.sp),
        decoration: BoxDecoration(
          color: brightness == Brightness.dark
              ? colorForButton
              : trainerAppBarButtonsBackground,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: Text(
          'Параметры тренажера',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: brightness == Brightness.dark ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
