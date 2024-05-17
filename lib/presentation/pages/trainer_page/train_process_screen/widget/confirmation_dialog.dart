import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/utils/app_colors.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return AlertDialog(
      backgroundColor: brightness == Brightness.dark
          ? colorForMaterialCardDark
          : secondColorLight,
      title: Text(
        'Вы точно хотите завершить тренажер?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0.sp,
        ),
      ),
      content: Text(
        'После закрытия тренажера, весь его прогресс пропадет',
        style: TextStyle(fontSize: 16.0.sp),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(
              true,
            ); // Возвращает true при нажатии "Да"
          },
          child: Text(
            'Да',
            style: TextStyle(
              color: Colors.red, // Любой цвет, который вы хотите использовать
              fontSize: 18.0.sp,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(
              context,
            ).pop(false); // Возвращает false при нажатии "Нет"
          },
          child: const Text(
            'Нет',
            style: TextStyle(
              color: Colors.blue, // Любой цвет, который вы хотите использовать
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
