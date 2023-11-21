import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/show_launching_trainer.dart';
import 'package:study_ready/utils/app_colors.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class TrainerCard extends StatelessWidget {
  const TrainerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176.43.h,
      width: 335.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16.sp,
        ),
        color: colorForCardTrainerBlue,
      ),
      padding: EdgeInsets.only(
        top: 20.h,
        left: 20.w,
        right: 20.w,
      ),
      margin: EdgeInsets.only(
        top: 26.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      16.sp,
                    ),
                    color: secondColor,
                  ),
                  height: 22.h,
                  width: 69.45.w,
                ),
                Text(
                  '0/30',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            'Непрерывная математика',
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Базовые опредления',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 22.sp,
                  ),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  showLaunchingTrainer(
                    context,
                  );
                },
                child: Text(
                  'Начнем',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  //pictureForTrainer,
                  backgrondForTrainerCard,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
