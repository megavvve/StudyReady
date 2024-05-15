import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreetingsBackgroundRectangle extends StatelessWidget {
  const GreetingsBackgroundRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -(11 * pi) / 80,
      child: Container(
        height: 200.h,
        width: 600.w,
        color: const Color(0xFFAEC6FF),
      ),
    );
  }
}
