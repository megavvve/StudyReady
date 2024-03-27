import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

//leading icons
final mainIcon = Icon(
  Icons.home_outlined,
  size: 50.sp,
  color: Colors.black,
);

//leading icons
final materialIcon = Icon(
  Icons.menu_book_outlined,
  size: 50.sp,
  color: Colors.black,
);

//leading icons
final trainerIcon = SvgPicture.asset(
  "assets/icons/navigation/trainer_icon.svg",
  color: Colors.black,
  width: 50.w,
  height: 50.h,
);

//leading icons
final addQuestionIcon = Icon(
  Icons.quiz_outlined,
  size: 50.sp,
  color: Colors.black,
);

//titles
final mainTitle = Text(
  'Главная',
  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
  textAlign: TextAlign.center,
);

//titles
final materialTitle = Text(
  'Материалы',
  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
  textAlign: TextAlign.center,
);

//titles
final trainerTitle = Text(
  'Тренажер',
  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
  textAlign: TextAlign.center,
);

//titles
final addQuestionTitle = Text(
  'Добавить вопрос',
  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
  textAlign: TextAlign.center,
);

//trailing icon
final trailingIcon = Icon(
  Icons.chevron_right_sharp,
  size: 35.sp,
  color: Colors.black,
);

//divider
final divider = Divider(
  color: Colors.black,
  indent: 20.w,
  endIndent: 30.w,
);
