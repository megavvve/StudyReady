import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/question_params/answer_parametrs_screen.dart';
import 'package:study_ready/utils/app_colors.dart';

class OptionsButton extends StatelessWidget {
  const OptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(16.sp),
          ),
        ),
        fixedSize: MaterialStatePropertyAll(
          Size(304.w, 57.h),
        ),
        backgroundColor: brightness == Brightness.dark
            ? MaterialStatePropertyAll(colorForFindTextDark)
            : const MaterialStatePropertyAll(Colors.white),
      ),
      onPressed: () {
        Navigator.push(
          context,
          customPageRoute(
            const AnsParsScreen(),
          ),
        );
        //messAboutFeatureImprovements(context);
      },
      clipBehavior: Clip.none,
      child: Row(
        children: [
          Icon(
            Icons.settings_outlined,
            size: 30.sp,
            color: Colors.black,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            'Параметры',
            style: TextStyle(
                color:
                    brightness == Brightness.dark ? Colors.white : Colors.black,
                fontSize: 16.sp),
          )
        ],
      ),
    );
  }
}
