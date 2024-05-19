import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/helper_bloc/helper_cubit.dart';
import 'package:study_ready/utils/app_colors.dart';

class HelperSwitchButton extends StatefulWidget {
  const HelperSwitchButton({super.key});

  @override
  State<HelperSwitchButton> createState() => _HelperSwitchButtonState();
}

class _HelperSwitchButtonState extends State<HelperSwitchButton> {
  @override
  Widget build(BuildContext context) {
    final helperDisabled = context.watch<HelperCubit>().state.disabled;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16.sp),
      width: 362.w,
      height: 70.h,
      decoration: BoxDecoration(
        color: const Color(0xFFAEC6FF),
        borderRadius: BorderRadius.all(
          Radius.circular(16.sp),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Подсказки",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            width: 40.w,
          ),
          Switch(
            value: helperDisabled,
            activeColor: mainColorLight,
            onChanged: (bool value) {
              context.read<HelperCubit>().switchHelper(!value);
            },
          ),
        ],
      ),
    );
  }
}
