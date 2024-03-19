import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

//leading icons
final mainIcon = Icon(
  Icons.home_outlined,
  size: 35.sp,
  color: Colors.black,
);

//leading icons
final materialIcon = SvgPicture.asset(
  "assets/icons/navigation/material_icon.svg",
  width: 35.sp,
  //color: Colors.black,
);

//titles
final mainTitle = Text(
  'Главная',
  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w900),
  textAlign: TextAlign.center,
);
//titles
final materialTitle = Text(
  'Материалы',
  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w900),
  textAlign: TextAlign.center,
);

//trailing icon
final trailingIcon = Icon(
  Icons.chevron_right_sharp,
  size: 35.sp,
  color: Colors.black,
);
