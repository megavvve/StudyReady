import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectWidget extends StatefulWidget {
  const SubjectWidget({super.key});

  @override
  State<SubjectWidget> createState() => _FirstWidgetState();
}

class _FirstWidgetState extends State<SubjectWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          width: 321.w,
          height: 116.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Text(
            'Предмет',
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
        Positioned(
          top: 63,
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            width: 309.w,
            height: 113.h,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(198, 216, 245, 1),
                borderRadius: BorderRadius.circular(16)),
            child: Container(
              alignment: Alignment.centerLeft,
              width: 241.w,
              height: 27.h,
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Введите предмет...',
                    hintStyle: TextStyle(fontSize: 18),
                  ),
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ),
        //зеленая карточка введите правильный ответ
      ],
    );
  }
}
