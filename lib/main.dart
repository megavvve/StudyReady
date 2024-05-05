import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:study_ready/firebase_options.dart';
import 'package:study_ready/injection_container.dart';
import 'package:study_ready/presentation/blocs/study_material_bloc/study_material_bloc.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/home_page/home_screen.dart';
import 'package:study_ready/utils/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );
  await setup();

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
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<TrainerBloc>(
          create: (_) => getIt<TrainerBloc>(),
        ),
        BlocProvider<StudyMaterialBloc>(
          create: (_) => getIt<StudyMaterialBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('ru'),
          title: 'StudyReady',
          theme: lightTheme,
          home: child,
        ),
        child: const HomeScreen(), // start screen
      ),
    );
  }
}
