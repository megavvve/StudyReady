import 'package:flutter/material.dart';
import 'package:study_ready/presentation/pages/home_screen/widgets/letter_s.dart';
import 'package:study_ready/presentation/pages/home_screen/widgets/trainer.dart';
import 'package:study_ready/presentation/pages/home_screen/widgets/tudy.dart';

final trainerButton = IconButton(
  onPressed: () {},
  padding: const EdgeInsets.all(0),
  icon: Container(
    width: 375,
    child: Stack(
      children: [
        Positioned(
          child: sLetterBack,
        ),
        Positioned(
          child: sLetterFront,
        ),
        Positioned(
          left: 121.72,
          bottom: 187.91,
          child: trainerText,
        ),
        Positioned(
          left: 165.87,
          bottom: 143.2,
          child: tudyText,
        ),
      ],
    ),
  ),
);
