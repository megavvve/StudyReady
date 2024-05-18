import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_ready/data/repositories/helper_repository/helper_repository.dart';
import 'package:study_ready/data/repositories/theme_repository/theme_repository.dart';

import 'package:study_ready/firebase_options.dart';
import 'package:study_ready/injection_container.dart';
import 'package:study_ready/presentation/blocs/study_material_bloc/study_material_bloc.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_state.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/first_screen/first_screen.dart';
import 'package:study_ready/utils/app_themes.dart';

import 'presentation/blocs/helper_bloc/helper_cubit.dart';

Future<void> main() async {
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

  final prefs = await SharedPreferences.getInstance();
  runApp(
    MyApp(
      preferences: prefs,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.preferences,
  });

  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    final themeRepository = ThemeRepository(preferences: preferences);
    final helperRepository = HelperRepository(preferences: preferences);

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
        BlocProvider(
          create: (context) => ThemeCubit(
            themeRepository: themeRepository,
          ),
        ),
        BlocProvider(
          create: (context) => HelperCubit(
            helperRepository: helperRepository,
          ),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: const Locale('ru'),
              title: 'StudyReady',
              theme: state.isDark ? darkTheme : lightTheme,
              home: child,
            ),
            child: const FirstScreen(), // start screen
          );
        },
      ),
    );
  }
}
