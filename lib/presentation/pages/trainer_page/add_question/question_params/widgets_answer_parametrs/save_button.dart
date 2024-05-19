import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            brightness == Brightness.dark
                ? const Color(0xFF458BFF)
                : const Color.fromRGBO(119, 165, 245, 1),
          ),
          fixedSize: MaterialStatePropertyAll(
            Size(
              305.w,
              55.h,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Сохранить',
          style: TextStyle(color: Colors.black, fontSize: 20.sp),
        ),
      ),
    );
  }
}
