import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/registration_screen/registration_screen.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const RegistrationScreen()),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF4575CD),
          borderRadius: BorderRadius.all(
            Radius.circular(16.sp),
          ),
        ),
        width: 162.w,
        height: 47.h,
        child: Text(
          "Далее",
          style: TextStyle(
              color: const Color(0xFFBFD3F3),
              fontSize: 23.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
