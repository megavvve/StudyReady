import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


IconButton BurgerNavigationLeading(BuildContext context) {
  return  IconButton(
    icon: Icon(
      Icons.menu,
      size: 40.sp,
      weight: 10.w,
    ),
    onPressed: () {
      Scaffold.of(context).openDrawer();
    },
    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
  );
}
