import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/first_screen/widgets/description_background_rectangle.dart';
import 'package:study_ready/presentation/pages/first_screen/widgets/description_field.dart';
import 'package:study_ready/presentation/pages/first_screen/widgets/greetings_background_rectangle.dart';
import 'package:study_ready/presentation/pages/first_screen/widgets/greetings_field.dart';
import 'package:study_ready/presentation/pages/first_screen/widgets/next_button.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF0FF),
      body: Stack(
        children: [
          Positioned(
            top: 387.h,
            child: const DescriptionBackgroundRectangle(),
          ),
          Positioned(
            top: 150.h,
            left: -100.w,
            child: const GreetingsBackgroundRectangle(),
          ),
          Positioned(
            top: 365.4.h,
            left: 230.w,
            child: rLetterBackFr,
          ),
          Positioned(
            top: 375.4.h,
            left: 250.w,
            child: rLetterFrontFr,
          ),
          Positioned(
            top: 100.h,
            left: 0.w,
            child: sLetterBackFr,
          ),
          Positioned(
            top: 100.h,
            left: 0.w,
            child: sLetterFrontFr,
          ),
          Positioned(
            top: 173.h,
            left: 157.w,
            child: const GreetingsField(),
          ),
          Positioned(
            top: 470.h,
            left: 40.w,
            child: const DescriptionField(),
          ),
          Positioned(
            top: 720.h,
            left: 107.w,
            child: const NextButton(),
          ),
        ],
      ),
    );
  }
}
