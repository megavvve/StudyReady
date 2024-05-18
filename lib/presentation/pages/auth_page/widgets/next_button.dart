import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/auth_page/widgets/widget/change_notifier_for_auth.dart';
import 'package:study_ready/presentation/pages/auth_page/widgets/widget/sign_in_and_sign_up.dart';

class NextButton extends StatelessWidget {
  final ChangeNotifierForAuth changeNotifierForAuth;
  const NextButton({super.key, required this.changeNotifierForAuth});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        !changeNotifierForAuth.isNeedRegistry
            ? await signInWithEmailAndPassword(context, changeNotifierForAuth)
            : createUserWithEmailAndPassword(context, changeNotifierForAuth);
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
