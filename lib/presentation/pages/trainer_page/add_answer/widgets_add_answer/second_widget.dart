import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondWidget extends StatefulWidget {
  const SecondWidget({super.key});

  @override
  State<SecondWidget> createState() => _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
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
            child: Text('2', style: TextStyle(fontSize: 18.sp)),
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 241.w,
            height: 27.h,
            child: const TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                isCollapsed: true,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Введите ответ...',
                hintStyle: TextStyle(fontSize: 18),
              ),
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
