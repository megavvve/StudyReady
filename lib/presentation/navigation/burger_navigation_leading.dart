import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// ignore: non_constant_identifier_names
IconButton BurgerNavigationLeading(BuildContext context) {
  return  IconButton(
    icon: Icon(
      Icons.menu,
      size: 30.sp,
      weight: 10.w,
      color: Colors.black,
    ),
    onPressed: () {
      Scaffold.of(context).openDrawer();
    },
    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
  );
}
