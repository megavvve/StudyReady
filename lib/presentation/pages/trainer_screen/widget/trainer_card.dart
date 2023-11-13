import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainerCard extends StatelessWidget {
  const TrainerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176.43.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.sp),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(
        top: 22.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 40.h,
            child: Text('0/30', style: TextStyle(fontSize: 16.sp)),
          ),
          SizedBox(
            height: 60.h,
            child: Text('Непрерывная математика',
                style: TextStyle(fontSize: 23.sp)),
          ),
          SizedBox(height: 20.h),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 22.sp),
            ),
            onPressed: () {
              showTrainer4(context);
            },
            child: const Text('Начнем'),
          ),
        ],
      ),
    );
  }

  void showTrainer4(BuildContext context) {
    showModalBottomSheet<void>

      (

      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 340.h,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 40.h,
                  child: Text('Непрерывная математика',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.sp)),
                ),
                SizedBox(
                  height: 40.h,
                  child: Text('Тема: последовательность',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.sp)),
                ),
                Expanded(
                  child: Text(
                      textAlign: TextAlign.center,
                      'Описание: Говорят, что задана числовая последовательность если каждому натуральному числу 𝑛 поставлено в соответствие ве-щественное число Числовая последовательность {𝑎𝑛}𝑛= ∞ называется схо-дящейся, если существует такое число 𝑎, что для любого ε > 0 найдется та-кое целоt',
                      style: TextStyle(fontSize: 16.sp)),
                ),
                ElevatedButton(
                  child: Text('Поехали!',
                      style: TextStyle(fontSize: 24.sp)),
                  onPressed: () => Navigator.pop(context),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}