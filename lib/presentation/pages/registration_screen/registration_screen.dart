import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/presentation/pages/registration_screen/widgets/email_form.dart';
import 'package:study_ready/presentation/pages/registration_screen/widgets/headline.dart';
import 'package:study_ready/presentation/pages/registration_screen/widgets/login_form.dart';
import 'package:study_ready/presentation/pages/registration_screen/widgets/next_button.dart';
import 'package:study_ready/presentation/pages/registration_screen/widgets/skip_button.dart';
import 'package:study_ready/utils/app_colors.dart';

import 'widgets/password_form.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return Scaffold(
      backgroundColor: brightness == Brightness.dark
          ? backgroundColorDark
          : backgroundColorLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Headline(),
            SizedBox(
              height: 30.h,
            ),
            const EmailForm(),
            SizedBox(
              height: 30.h,
            ),
            const LoginForm(),
            SizedBox(
              height: 30.h,
            ),
            const PasswordForm(),
            SizedBox(
              height: 30.h,
            ),
            const SkipButton(),
            SizedBox(
              height: 30.h,
            ),
            const NextButton(),
          ],
        ),
      ),
    );
  }
}
