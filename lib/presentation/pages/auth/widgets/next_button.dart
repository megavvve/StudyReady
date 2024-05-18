import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/auth/widgets/change_notifier_for_auth.dart';
import 'package:study_ready/presentation/pages/home_page/home_screen.dart';

class NextButton extends StatelessWidget {
  final ChangeNotifierForAuth changeNotifierForAuth;
  const NextButton({super.key, required this.changeNotifierForAuth});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const HomeScreen()),
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
            color: Colors.white,
            fontSize: 23.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
