import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/home_screen/widgets/materials_button.dart';
import 'package:study_ready/presentation/pages/home_screen/widgets/trainer_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0.h,
            child: materialsButton,
          ),
          Positioned(
            bottom: 400.h,
            child: trainerButton,
          ),
        ],
      ),
    );
  }
}
