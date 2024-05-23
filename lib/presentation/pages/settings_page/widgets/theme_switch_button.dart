import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:study_ready/utils/app_colors.dart';

class ThemeSwitchButton extends StatefulWidget {
  const ThemeSwitchButton({super.key});

  @override
  State<ThemeSwitchButton> createState() => _ThemeSwitchButtonState();
}

class _ThemeSwitchButtonState extends State<ThemeSwitchButton> {
  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.sp),
        height: 70.h,
        //width: 315.w,
        decoration: BoxDecoration(
          color: brightness == Brightness.dark
              ? colorForMaterialCardDark
              : const Color(0xFFAEC6FF),
          borderRadius: BorderRadius.all(
            Radius.circular(16.sp),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Темная тема",
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ),
            Switch(
              value: brightness == Brightness.dark,
              activeColor: mainColorLight,
              onChanged: (bool value) {
                context.read<ThemeCubit>().setThemeBrightness(
                      value ? Brightness.dark : Brightness.light,
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
