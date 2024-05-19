import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

import 'description_background_rectangle.dart';
import 'description_field.dart';
import 'greetings_background_rectangle.dart';
import 'greetings_field.dart';

class MainForm extends StatelessWidget {
  const MainForm({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return SizedBox(
      height: 725.h,
      child: Stack(
        children: [
          Positioned(
            top: 387.h,
            child: const DescriptionBackgroundRectangle(),
          ),
          Positioned(
            top: 150.h,
            left: -100.w,
            child: const GreetingsBackgroundRectangle(),
          ),
          Positioned(
            top: 365.4.h,
            left: 230.w,
            child: rLetterBackFr,
          ),
          Positioned(
            top: 375.4.h,
            left: 250.w,
            child: rLetterFrontFr,
          ),
          Positioned(
            top: 100.h,
            left: 0.w,
            child: brightness == Brightness.dark
                ? sLetterBackFrDark
                : sLetterBackFr,
          ),
          Positioned(
            top: 100.h,
            left: 0.w,
            child: brightness == Brightness.dark
                ? sLetterFrontFrDark
                : sLetterFrontFr,
          ),
          Positioned(
            top: 173.h,
            left: 157.w,
            child: const GreetingsField(),
          ),
          Positioned(
            top: 470.h,
            left: 40.w,
            child: const DescriptionField(),
          ),
        ],
      ),
    );
  }
}
