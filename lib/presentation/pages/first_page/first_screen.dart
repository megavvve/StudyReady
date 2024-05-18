import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/presentation/pages/first_page/widgets/main_form.dart';
import 'package:study_ready/presentation/pages/first_page/widgets/next_button.dart';
import 'package:study_ready/utils/app_colors.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

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
            const MainForm(),
            SizedBox(
              height: 10.h,
            ),
            const NextButton(),
          ],
        ),
      ),
    );
  }
}
