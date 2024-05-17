import 'package:flutter/material.dart';
import 'package:study_ready/utils/app_colors.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: mainColorDark,
  scaffoldBackgroundColor: Colors.black,
  textTheme: textThemeDark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: mainColorDark,
    brightness: Brightness.dark,
  ),
);

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: mainColorLight,
  scaffoldBackgroundColor: Colors.white,
  textTheme: textThemeLight,
  colorScheme: ColorScheme.fromSeed(
    seedColor: mainColorLight,
    brightness: Brightness.light,
  ),
);

const textThemeLight = TextTheme(
  displayLarge: TextStyle(color: Colors.black),
  displayMedium: TextStyle(color: Colors.black),
  displaySmall: TextStyle(color: Colors.black),
  headlineLarge: TextStyle(color: Colors.black),
  headlineMedium: TextStyle(color: Colors.black),
  headlineSmall: TextStyle(color: Colors.black),
  titleLarge: TextStyle(color: Colors.black),
  titleMedium: TextStyle(color: Colors.black),
  titleSmall: TextStyle(color: Colors.black),
  bodyLarge: TextStyle(color: Colors.black),
  bodyMedium: TextStyle(color: Colors.black),
  bodySmall: TextStyle(color: Colors.black),
  labelLarge: TextStyle(color: Colors.black),
  labelMedium: TextStyle(color: Colors.black),
  labelSmall: TextStyle(color: Colors.black),
);

const textThemeDark = TextTheme(
  displayLarge: TextStyle(color: Colors.white),
  displayMedium: TextStyle(color: Colors.white),
  displaySmall: TextStyle(color: Colors.white),
  headlineLarge: TextStyle(color: Colors.white),
  headlineMedium: TextStyle(color: Colors.white),
  headlineSmall: TextStyle(color: Colors.white),
  titleLarge: TextStyle(color: Colors.white),
  titleMedium: TextStyle(color: Colors.white),
  titleSmall: TextStyle(color: Colors.white),
  bodyLarge: TextStyle(color: Colors.white),
  bodyMedium: TextStyle(color: Colors.white),
  bodySmall: TextStyle(color: Colors.white),
  labelLarge: TextStyle(color: Colors.white),
  labelMedium: TextStyle(color: Colors.white),
  labelSmall: TextStyle(color: Colors.white),
);
