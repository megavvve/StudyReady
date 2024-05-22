import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_ready/utils/home_screen/icons_pathes.dart';

//light theme
final regBackgroundTrepezoid = SvgPicture.asset(
  "assets/icons/registration_screen/registration_trapezoid.svg",
);

final regBackgroundTrepezoidDark = SvgPicture.asset(
  "assets/icons/registration_screen/registration_trapezoid.svg",
  color: const Color(0xFF2A42B6),
);

final eadyText = SvgPicture.asset(
  eadyTextPath,
  width: 195.w,
  height: 82.h,
);

final rLetterFront = SvgPicture.asset(
  rLetterFrontPath,
  width: 137.w,
  height: 299.h,
);

final rLetterFrontFr = SvgPicture.asset(
  "assets/icons/first_screen/letter_r_front_fr.svg",
);

final rLetterBack = SvgPicture.asset(
  rLetterBackPath,
  width: 137.w,
  height: 299.h,
);

final rLetterBackFr = SvgPicture.asset(
  "assets/icons/first_screen/letter_r_back_fr.svg",
);

final sLetterBack = SvgPicture.asset(
  sLetterBackPath,
  width: 173.w,
  height: 282.h,
);

final sLetterBackFr = SvgPicture.asset(
  "assets/icons/first_screen/letter_s_back_fr.svg",
);

final sLetterBackFrDark = SvgPicture.asset(
  "assets/icons/first_screen/letter_s_back_fr.svg",
  color: const Color(0xFF000000),
);

final sLetterFront = SvgPicture.asset(
  sLetterFrontPath,
  width: 173.w,
  height: 282.h,
);

final sLetterFrontFr = SvgPicture.asset(
  "assets/icons/first_screen/letter_s_front_fr.svg",
);

final sLetterFrontFrDark = SvgPicture.asset(
  "assets/icons/first_screen/letter_s_front_fr.svg",
  color: const Color(0xFF1C1A1A),
);

final materialsText = SvgPicture.asset(
  materialTextPath,
  width: 231.w,
  height: 79.h,
);

final trainerText = SvgPicture.asset(
  trainerTextPath,
  width: 244.w,
  height: 76.h,
);

final tudyText = SvgPicture.asset(
  tudyTextPath,
  width: 194.w,
  height: 82.h,
);

final duckBackground = SvgPicture.asset(
  "assets/icons/settings_screen/duck_background.svg",
  width: 62.w,
  height: 62.h,
);

final duck = SvgPicture.asset(
  "assets/icons/settings_screen/duck.svg",
  width: 39.w,
  height: 37.h,
);

final settingsBackgroundLight = SvgPicture.asset(
  "assets/images/settings/settings_background.svg",
  width: 347.w,
  height: 630.h,
);

final settingsBackgroundDark = SvgPicture.asset(
  "assets/images/settings/settings_background.svg",
  width: 347.w,
  height: 630.h,
  color: Colors.white,
);

final rectangle = SvgPicture.asset(
  rectanglePath,
  height: 452.h,
  //fit: BoxFit.scaleDown, semanticsLabel: 'Image',
);

final backgrondForTrainerCard = SvgPicture.asset(
  'assets/images/trainer/backgroung_for_trainer.svg',
);

final backgrondsForTrainerCard = [
  SvgPicture.asset(
    'assets/images/trainer/background_for_trainer.svg',
  ),
  
  SvgPicture.asset(
    'assets/images/trainer/background1_for_trainer.svg',
  ),
  /*
  SvgPicture.asset(
    'assets/images/trainer/background2_for_trainer.svg',
  ),
  */
  SvgPicture.asset(
    'assets/images/trainer/background3_for_trainer.svg',
  ),
];

final pictureForTrainer = SvgPicture.asset(
  'assets/images/trainer/picture_for_trainer.svg',
  width: 90.w,
  height: 75.h,
);

final backgroundForAppBar = SvgPicture.asset(
  'assets/images/trainer/background_for_app_bar_trainer.svg',
);

//dark theme
final sLetterBackDark = SvgPicture.asset(
  sLetterBackPath,
  width: 173.w,
  height: 282.h,
  color: const Color(0xFF000000),
);

final sLetterFrontDark = SvgPicture.asset(
  sLetterFrontPath,
  width: 173.w,
  height: 282.h,
  color: const Color(0xFF1C1A1A),
);
