import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_colors.dart';

ButtonStyle StyleForAnswer(bool f) {
  return f
      ? ElevatedButton.styleFrom(
          foregroundColor: colorForCardTrainerBlue,
          backgroundColor: secondColor, // Цвет текста при нормальном состоянии
          elevation: 1, // Высота поднятия кнопки
          // Отступы
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.sp), // Закругленные углы
              side: BorderSide(color: secondColor, width: 2.w)),
        )
      : ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white, // Цвет текста при нормальном состоянии
          elevation: 0, // Высота поднятия кнопки
          // Отступы
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sp), // Закругленные углы
          ),
        );
}
