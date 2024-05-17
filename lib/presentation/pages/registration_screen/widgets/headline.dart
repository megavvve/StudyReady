import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class Headline extends StatelessWidget {
  const Headline({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return Container(
      margin: EdgeInsets.only(top: 27.h),
      width: 375.w,
      height: 210.h,
      child: Stack(
        children: [
          Positioned(
            left: -1.w,
            child: brightness == Brightness.dark ? regBackgroundTrepezoidDark : regBackgroundTrepezoid,
          ),
          Positioned(
            top: 65.h,
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
        ],
      ),
    );
  }
}
