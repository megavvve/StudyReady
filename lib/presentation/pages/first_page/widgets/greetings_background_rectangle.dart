import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';

class GreetingsBackgroundRectangle extends StatelessWidget {
  const GreetingsBackgroundRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return Transform.rotate(
      angle: -(11 * pi) / 80,
      child: Container(
        height: 200.h,
        width: 600.w,
        color: brightness == Brightness.dark
            ? const Color(0xFF607EEB)
            : const Color(0xFFAEC6FF),
      ),
    );
  }
}
