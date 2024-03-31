import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_ready/utils/home_screen/icons_pathes.dart';

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

final rLetterBack = SvgPicture.asset(
  rLetterBackPath,
  width: 137.w,
  height: 299.h,
);

final sLetterBack = SvgPicture.asset(
  sLetterBackPath,
  width: 173.w,
  height: 282.h,
);

final sLetterFront = SvgPicture.asset(
  sLetterFrontPath,
  width: 173.w,
  height: 282.h,
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
  SvgPicture.asset(
    'assets/images/trainer/background2_for_trainer.svg',
  ),
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
