import 'package:flutter/material.dart';
import 'package:study_ready/presentation/pages/main_screen/main_screen.dart';
import 'package:study_ready/utils/app_themes.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyReady',
      theme: lightTheme,
      home: const MainScreen(),
    );
  }
}


