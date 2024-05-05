import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/question_params/answer_parametrs_screen.dart';

class OptionsButton extends StatelessWidget {
  const OptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: const MaterialStatePropertyAll(Colors.white),
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
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
          )
        ],
      ),
    );
  }
}
