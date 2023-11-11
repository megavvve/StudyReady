import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_svg_assets.dart';


final trainerButton = IconButton(
  onPressed: () {},
   splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  padding: const EdgeInsets.all(0),
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
