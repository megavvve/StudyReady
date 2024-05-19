// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:study_ready/utils/app_colors.dart';

ButtonStyle StyleForAnswer(bool f, BuildContext context) {
  final brightness = context.watch<ThemeCubit>().state.brightness;
  return f
      ? ElevatedButton.styleFrom(
          foregroundColor: colorForCardTrainerBlue,
          backgroundColor: brightness == Brightness.dark
              ? colorForMaterialCardDark
              : secondColorLight, // Цвет текста при нормальном состоянии
          elevation: 1, // Высота поднятия кнопки
          // Отступы
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sp), // Закругленные углы
            side: BorderSide(
              color: brightness == Brightness.dark
                  ? secondColorDark
                  : secondColorLight,
              width: 2.w,
            ),
          ),
        )
      : ElevatedButton.styleFrom(
          foregroundColor: brightness == Brightness.dark
              ? colorForMaterialCardDark
              : Colors.white,
          backgroundColor: brightness == Brightness.dark
              ? colorForMaterialCardDark
              : Colors.white,
          elevation: 0,
          // Отступы
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sp),
          ),
        );
}
