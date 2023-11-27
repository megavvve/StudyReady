import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showResultModal(BuildContext context, bool isCorrect) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.sp),
            topRight: Radius.circular(16.sp),
          ),
        ),
        padding: EdgeInsets.all(15.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              isCorrect ? 'Правильно!' : 'Неправильно',
              style: TextStyle(
                
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isCorrect ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              isCorrect
                  ? 'Отличная работа! Продолжайте в том же духе.'
                  : 'Попробуйте еще раз. У вас получится!',
                  
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp,color: isCorrect ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // nextQuestion();
                // if (selectedQuestion > howmuchQuestion) {
                //   Navigator.of(context).pushReplacement(
                //     PageRouteBuilder(
                //       transitionDuration: Duration.zero,
                //       pageBuilder:
                //           (context, animation, secondaryAnimation) {
                //         return const TrainerScreen();
                //       },
                //       transitionsBuilder: (context, animation,
                //           secondaryAnimation, child) {
                //         return child;
                //       },
                //     ),
                //   );
                // }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isCorrect ? Colors.green : Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.sp),
                ),
              ),
              child: Text(
                'Следующий вопрос',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
    },
  );
}
