import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/injection_container.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/home_page/home_screen.dart';
import 'package:study_ready/utils/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  // final Reference ref =
  //     FirebaseStorage.instance.ref().child('Математический анализ.pdf');
  // final String downloadURL = await ref.getDownloadURL();
  await ScreenUtil.ensureScreenSize();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocProvider<TrainerBloc>(
      create: (_) => getIt<TrainerBloc>(),
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
