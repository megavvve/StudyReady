import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/trainer_screen.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class TrainerButtonWidget extends StatelessWidget {
  const TrainerButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(
          customPageRoute(
            const TrainerScreen(),
          ),
        );
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      padding: EdgeInsets.all(0.sp),
      icon: SizedBox(
        width: 375.w,
        child: Stack(
          children: [
            Positioned(
              child: sLetterBack,
            ),
            Positioned(
              child: sLetterFront,
            ),
            Positioned(
              left: 121.72.w,
              bottom: 187.91.h,
              child: trainerText,
            ),
            Positioned(
              left: 165.87.w,
              bottom: 143.2.h,
              child: tudyText,
            ),
          ],
        ),
      ),
    );
  }
}
