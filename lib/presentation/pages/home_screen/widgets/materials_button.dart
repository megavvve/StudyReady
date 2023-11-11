import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

final materialsButton = IconButton(
  onPressed: () {},
  padding: const EdgeInsets.all(0),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  icon: Stack(
    children: [
      rectangle,
      Positioned(
        left: 39.w,
        bottom: 50.h,
        child: rLetterBack,
      ),
      Positioned(
        left: 49.w,
        bottom: 50.h,
        child: rLetterFront,
      ),
      Positioned(
        left: 150.w,
        bottom: 192.25.h,
        child: materialsText,
      ),
      Positioned(
        left: 161.23.w,
        bottom: 148.41.h,
        child: eadyText,
      ),
    ],
  ),
);
