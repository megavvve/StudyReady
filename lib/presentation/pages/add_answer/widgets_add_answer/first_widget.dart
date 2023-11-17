import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstWidget extends StatefulWidget {
  const FirstWidget({super.key});

  @override
  State<FirstWidget> createState() => _FirstWidgetState();
}

class _FirstWidgetState extends State<FirstWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        //белая карточка с названием вопроса
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          width: 321.w,
          height: 116.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Text(
            'Название вопроса',
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
        //белая карточка с названием вопроса

        //зеленая карточка введите правильный ответ
        Positioned(
          top: 63,
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            width: 309.w,
            height: 113.h,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(204, 245, 203, 1),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 39.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text('1', style: TextStyle(fontSize: 18.sp)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 241.w,
                  height: 27.h,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Введите правильный ответ...',
                        style: TextStyle(fontSize: 18.sp)),
                  ),
                ),
              ],
            ),
          ),
        ),
        //зеленая карточка введите правильный ответ
      ],
    );
  }
}
