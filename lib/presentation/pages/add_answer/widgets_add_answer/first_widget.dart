import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstWidget extends StatefulWidget {
  const FirstWidget({super.key});

  @override
  State<FirstWidget> createState() => _FirstWidgetState();
}

class _FirstWidgetState extends State<FirstWidget> {
  final _firstWidgetController = TextEditingController();
  final _questionNameContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        //белая карточка с названием вопроса
        Container(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0.h),
            alignment: Alignment.topLeft,
            width: 321.w,
            height: 116.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16.sp)),
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: _questionNameContoller,
              minLines: 1,
              decoration: InputDecoration(
                  border: const UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Название вопроса...',
                  hintStyle: TextStyle(
                    fontSize: 20.sp,
                  )),
              style: TextStyle(fontSize: 20.sp),
            )),
        //белая карточка с названием вопроса

        //зеленая карточка введите правильный ответ
        Positioned(
          top: 60.sp,
          child: Container(  
            padding: EdgeInsets.all(8.sp),
            alignment: Alignment.center,
            width: 309.w,
            height: 113.h,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(204, 245, 203, 1),
                borderRadius: BorderRadius.circular(16.sp)),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 39.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.sp)),
                  child: Text('1', style: TextStyle(fontSize: 18.sp)),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      controller: _firstWidgetController,
                      minLines: 1,
                      maxLines: 5,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsetsDirectional.only(start: 8.w),
                        isCollapsed: true,
                        border: const UnderlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Введите правильный ответ...',
                        hintMaxLines: 2,
                        hintStyle: TextStyle(fontSize: 18.sp,)
                      ),
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //зеленая карточка введите правильный ответ
      ],
    );
  }
}
