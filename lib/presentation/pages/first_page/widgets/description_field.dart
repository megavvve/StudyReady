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
      width: 200.w,
      height: 170.h,
      child: Text(
        "StudyReady - ваш надежный спутник в подготовке к экзаменам.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25.sp, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}
