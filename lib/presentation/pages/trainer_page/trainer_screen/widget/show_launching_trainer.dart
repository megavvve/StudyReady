import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/models/trainer.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/pages/trainer_page/train_process_screen/train_process_screen.dart';
import 'package:study_ready/utils/app_strings.dart';

void showLaunchingTrainer(BuildContext context, Trainer trainer) {
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
              (trainer.id == 1) ? "Непрерывная математика" : "",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Text(
                  'Тема: ',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  trainer.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Описание:',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              textAlign: TextAlign.start,
              (trainer.id==1)?descriptionForNepra: descriptionForMyTrainer,
              style: TextStyle(
                fontSize: 18.sp,
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
                      TrainProcessScreen(
                        trainer: trainer,
                      ),
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
