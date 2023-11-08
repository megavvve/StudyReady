import 'package:flutter/material.dart';
import 'package:study_ready/presentation/pages/home_screen/widgets/eady.dart';
import 'package:study_ready/presentation/pages/home_screen/widgets/letter_r.dart';
import 'package:study_ready/presentation/pages/home_screen/widgets/materials.dart';
import 'package:study_ready/presentation/pages/home_screen/widgets/rectangle.dart';

final materialsButton = IconButton(
  onPressed: () {},
  padding: const EdgeInsets.all(0),
  icon: Container(
    width: 375,
    child: Stack(
      children: [
        rectangle,
        Positioned(
          left: 29,
          bottom: 60,
          child: rLetterBack,
        ),
        Positioned(
          left: 49,
          bottom: 50,
          child: rLetterFront,
        ),
        Positioned(
          left: 138.38,
          bottom: 192.25,
          child: materialsText,
        ),
        Positioned(
          left: 161.23,
          bottom: 148.41,
          child: eadyText,
        ),
      ],
    ),
  ),
);
