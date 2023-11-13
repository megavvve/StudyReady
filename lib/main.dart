import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< Updated upstream
import 'package:study_ready/presentation/pages/home_screen/home_screen.dart';
=======
import 'package:study_ready/presentation/pages/main_screen/main_screen.dart';
import 'package:study_ready/presentation/pages/db_test_screen/db_test_screen.dart';
>>>>>>> Stashed changes
import 'package:study_ready/utils/app_themes.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
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
        home: const HomeScreen(),
      ),
    );
  }
}
