import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/home_page/widgets/custom_shape.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

final materialsButton = IconButton(
  onPressed: () {},
  padding: EdgeInsets.all(0.sp),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  icon: Stack(
    children: [
      // Flexible(
      //   fit: FlexFit.tight,
      //   child: Container(alignment: Alignment.bottomLeft, width: 375.w, height: 452.h, child: rectangle),
      // ),
      CustomShapeWidget(),
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
        left: 140.w,
        bottom: 192.25.h,
        child: materialsText,
      ),
      Positioned(
        left: 161.23.w,
        bottom: 148.41.h,
        child: eadyText,
      ),
      //Container(height: 200.h, color: Colors.grey,),
    ],
  ),
);
