// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/utils/app_colors.dart';

class TrainingResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final String randomResultingText;

  const TrainingResultScreen(
      {super.key,
      required this.correctAnswers,
      required this.totalQuestions,
      required this.randomResultingText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Результат тренировки',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          Navigator.pop(context);
          final bloc = context.read<TrainerBloc>();
          bloc.add(const InitLoad());
          return true;
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 100.0.sp,
                  ),
                ),
                SizedBox(height: 20.0.h),
                Text(
                  randomResultingText,
                  style: TextStyle(fontSize: 20.0.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.0.h),
                Text(
                  "Количество правильных",
                  style: TextStyle(color: Colors.green, fontSize: 20.sp),
                ),
                Text(
                  "ответов: $correctAnswers",
                  style: TextStyle(color: Colors.green, fontSize: 20.sp),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Text(
                  "Количество неправильных",
                  style: TextStyle(color: Colors.red, fontSize: 20.sp),
                ),
                Text(
                  "ответов: ${totalQuestions - correctAnswers}",
                  style: TextStyle(color: Colors.red, fontSize: 20.sp),
                ),
                SizedBox(height: 80.0.h),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor, // Цвет кнопки
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(16.sp), // Закругленные углы
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.sp, vertical: 12.sp), // Отступы
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      // final bloc = context.read<TrainerBloc>();
                      // bloc.add(const InitLoad());
                    },
                    child: Text(
                      'Продолжить',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
