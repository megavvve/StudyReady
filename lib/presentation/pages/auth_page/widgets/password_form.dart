import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/presentation/pages/auth_page/widgets/widget/change_notifier_for_auth.dart';

class PasswordForm extends StatelessWidget {
  final ChangeNotifierForAuth changeNotifierForAuth;
  const PasswordForm({super.key, required this.changeNotifierForAuth});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(4.sp),
          width: 127.w,
          height: 33.h,
          decoration: BoxDecoration(
            color: brightness == Brightness.dark
                ? const Color(0xFF656565)
                : const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.all(
              Radius.circular(16.sp),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.lock_outlined,
                size: 20.sp,
                color: Colors.black,
              ),
              Text(
                "Пароль:",
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(16.sp),
          width: 275.w,
          height: 64.h,
          decoration: BoxDecoration(
            color: brightness == Brightness.dark
                ? const Color(0xFF6D85C8)
                : const Color(0xFFD8E2FF),
            borderRadius: BorderRadius.all(
              Radius.circular(16.sp),
            ),
          ),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            onChanged: (value) {
              changeNotifierForAuth.passwordUser = value;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsetsDirectional.only(start: 1.w),
              isCollapsed: true,
              border: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: 'Введите пароль...',
              hintMaxLines: 1,
              hintStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
            style: TextStyle(fontSize: 18.sp, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
