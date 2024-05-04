import 'package:flutter/material.dart';
import 'package:study_ready/utils/app_colors.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: mainColor,
  scaffoldBackgroundColor: Colors.black,
  textTheme: textTheme,
  colorScheme: ColorScheme.fromSeed(
    seedColor: mainColor,
    brightness: Brightness.dark,
  ),
);

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: mainColor,
  scaffoldBackgroundColor: Colors.white,
  textTheme: textTheme,
  colorScheme: ColorScheme.fromSeed(
    seedColor: mainColor,
    brightness: Brightness.light,
  ),
);

const textTheme = TextTheme(
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
