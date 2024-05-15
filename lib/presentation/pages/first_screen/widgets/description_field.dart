// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 162.w,
      height: 107.h,
      child: Text(
        "Лютое\nописание",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 33.sp),
      ),
    );
  }
}
