// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';

import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/trainer_screen.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class TrainerButtonWidget extends StatelessWidget {
  const TrainerButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(
          customPageRoute(
            const TrainerScreen(),
          ),
        );
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      padding: EdgeInsets.all(0.sp),
      icon: SizedBox(
        width: 375.w,
        child: Stack(
          children: [
            Positioned(
              child:
                  brightness == Brightness.dark ? sLetterBackDark : sLetterBack,
            ),
            Positioned(
              child: brightness == Brightness.dark
                  ? sLetterFrontDark
                  : sLetterFront,
            ),
            Positioned(
              left: 121.72.w,
              bottom: 187.91.h,
              child: trainerText,
            ),
            Positioned(
              left: 160.87.w,
              bottom: 143.2.h,
              child: tudyText,
            ),
          ],
        ),
      ),
    );
  }
}
