import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/registration_screen/widgets/base_big_container.dart';
import 'package:study_ready/presentation/pages/registration_screen/widgets/base_small_container.dart';
import 'package:study_ready/presentation/pages/registration_screen/widgets/next_button.dart';
import 'package:study_ready/presentation/pages/registration_screen/widgets/skip_button.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 27.h,
            left: 0.w,
            child: regBackgroundTrepezoid,
          ),
          Positioned(
            top: 90.h,
            left: 10.w,
            child: Transform.rotate(
              angle: -(20 * pi) / 360,
              child: SizedBox(
                width: 316.91.w,
                height: 58.h,
                child: Text(
                  "ВВЕДИТЕ ДАННЫЕ:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 29.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 231.h,
            left: 50.w,
            child: const SmallContainer(),
          ),
          Positioned(
            top: 274.h,
            left: 50.w,
            child: const BigContainer(),
          ),
          Positioned(
            top: 367.h,
            left: 50.w,
            child: const SmallContainer(),
          ),
          Positioned(
            top: 410.h,
            left: 50.w,
            child: const BigContainer(),
          ),
          Positioned(
            top: 503.h,
            left: 50.w,
            child: const SmallContainer(),
          ),
          Positioned(
            top: 548.h,
            left: 50.w,
            child: const BigContainer(),
          ),
          Positioned(
            top: 650.h,
            left: 124.w,
            child: const SkipButton(),
          ),
          Positioned(
            top: 719.h,
            left: 107.w,
            child: const NextButton(),
          ),
        ],
      ),
    );
  }
}
