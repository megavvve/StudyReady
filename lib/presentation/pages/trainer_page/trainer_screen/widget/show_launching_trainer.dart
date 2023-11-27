import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';

import '../../train_process_screen/train_process_screen.dart';

void showLaunchingTrainer(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.sp),
          ),
          color: const Color(0xFF5970CC),
        ),
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        width: 350.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 54.h,
            ),
            Text(
              'Непрерывная математика',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Тема: последовательность',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp, color: Colors.white),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text('Описание:',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                )),
            Text(
              textAlign: TextAlign.start,
              ' Говорят, что задана числовая последовательность если каждому натуральному числу 𝑛 поставлено в соответствие ве-щественное число Числовая последовательность {𝑎𝑛}𝑛= ∞ называется схо-дящейся, если существует такое число 𝑎, что для любого ε > 0 найдется та-кое целоt',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 77.h,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: Text(
                  'Поехали!',
                  style: TextStyle(
                    fontSize: 24.sp,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    customPageRoute(
                      const TrainProcessScreen(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      );
    },
  );
}
