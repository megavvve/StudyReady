import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThirdWidget extends StatefulWidget {
  const ThirdWidget({super.key});

  @override
  State<ThirdWidget> createState() => _ThirdWidgetState();
}

class _ThirdWidgetState extends State<ThirdWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      width: 309.w,
      height: 113.h,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(198, 216, 245, 1),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 39.w,
            height: 34.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Text('3', style: TextStyle(fontSize: 18.sp)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: 241.w,
            height: 27.h,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Введите ответ...', style: TextStyle(fontSize: 18.sp)),
            ),
          ),
        ],
      ),
    );
  }
}