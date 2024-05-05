// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showValidationErrorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Ошибка! Некоторые поля пустые. Заполните все данные.',
        style: TextStyle(fontSize: 16.0.sp),
      ),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
    ),
  );
}
