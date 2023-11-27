import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/home_page/home_screen.dart';
import 'package:study_ready/utils/app_themes.dart';
import 'domain/database/initialize/first_launch.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
  FillTables ft = FillTables(); // launch basic data filling in tables
  ft.firstAppLaunch();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrainersBloc(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'StudyReady',
          theme: lightTheme,
          home: child,
        ),
        child: const HomeScreen(),
      ),
    
    );
  }
}
