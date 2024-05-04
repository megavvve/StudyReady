import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';

// ignore: non_constant_identifier_names
IconButton BurgerNavigationLeading(BuildContext context) {
  final brightness = context.watch<ThemeCubit>().state.brightness;
  return IconButton(
    icon: Icon(
      Icons.menu,
      size: 30.sp,
      weight: 10.w,
      color: brightness == Brightness.dark ? Colors.white : Colors.black,
    ),
    onPressed: () {
      Scaffold.of(context).openDrawer();
    },
    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
  );
}
