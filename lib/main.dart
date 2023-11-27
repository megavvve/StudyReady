import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/home_page/home_screen.dart';
import 'package:study_ready/utils/app_themes.dart';

import 'domain/database/initialize/first_launch.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
  FillTables ft = FillTables(); // launch basic data filling in tables
  ft.firstAppLaunch();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'StudyReady',
        theme: lightTheme,
        home: const HomeScreen() 
      ),
    );
  }
}
