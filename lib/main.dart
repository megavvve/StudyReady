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
import 'package:study_ready/data/repositories/theme_repository/theme_repository.dart';
import 'package:study_ready/domain/entities/auth.dart';
import 'package:study_ready/domain/entities/user_model.dart';

import 'package:study_ready/firebase_options.dart';
import 'package:study_ready/injection_container.dart';
import 'package:study_ready/presentation/blocs/study_material_bloc/study_material_bloc.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_state.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/blocs/user_cubit/user_cubit.dart';
import 'package:study_ready/presentation/pages/first_page/first_screen.dart';
import 'package:study_ready/presentation/pages/home_page/home_screen.dart';
import 'package:study_ready/utils/app_themes.dart';

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
    UserModel userModel = UserModel(
      uid: preferences.getString("uid"),
      displayName: preferences.getString("displayName"),
      email: preferences.getString("email"),
      password: preferences.getString(
        "password",
      ),
    );
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
        BlocProvider<UserCubit>(
          create: (context) => getIt<UserCubit>(),
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
            child: StreamBuilder(
                stream: Auth().authStateChanges,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    context.read<UserCubit>().setUserModel(userModel);
                    return HomeScreen();
                  } else {
                    return const FirstScreen();
                  }
                }),
          );
        },
      ),
    );
  }
}
