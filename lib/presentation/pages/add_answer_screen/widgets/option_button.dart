import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionsButton extends StatelessWidget {
  const OptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size(304.w, 57.h)),
          backgroundColor: const MaterialStatePropertyAll(Colors.white)),
      onPressed: () {},
      clipBehavior: Clip.none,
      child: Row(
        children: [
          Icon(
            Icons.settings,
            size: 40.sp,
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
