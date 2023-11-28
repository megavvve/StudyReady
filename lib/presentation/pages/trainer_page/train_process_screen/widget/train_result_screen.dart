import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainingResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;

  const TrainingResultScreen(
      {super.key, required this.correctAnswers, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Результат тренировки'),
        leading: IconButton(
          icon: const Icon(Icons.close),
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
          return true;
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Icon(
                Icons.check,
                color: Colors.green,
                size: 100.0.sp,
              ),
              SizedBox(height: 20.0.h),
              Text(
                'Правильные ответы: $correctAnswers из $totalQuestions',
                style: TextStyle(fontSize: 18.0.sp),
              ),
              SizedBox(height: 40.0.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Цвет кнопки
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(16.sp), // Закругленные углы
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.sp, vertical: 12.sp), // Отступы
                ),
                onPressed: () {
                  // Обработка нажатия кнопки
                  // Например, возврат на главный экран
                  Navigator.pop(context);
                  Navigator.pop(context);
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
            ],
          ),
        ),
      ),
    );
  }
}
