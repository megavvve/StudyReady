import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// ignore: non_constant_identifier_names
IconButton BurgerNavigationLeading(BuildContext context) {
  return  IconButton(
    padding: EdgeInsets.only(left: 20.w,),
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
