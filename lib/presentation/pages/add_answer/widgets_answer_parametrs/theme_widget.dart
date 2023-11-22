import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeWidget extends StatefulWidget {
  const ThemeWidget({super.key});

  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
  final _themeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(16.sp),
          alignment: Alignment.topLeft,
          width: 321.w,
          height: 116.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16.sp)),
          child: Text(
            'Тема',
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
        Positioned(
          top: 63.sp,
          child: Container(
            padding: EdgeInsets.all(8.sp),
            alignment: Alignment.centerLeft,
            width: 309.w,
            height: 113.h,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(198, 216, 245, 1),
                borderRadius: BorderRadius.circular(16.sp)),
            child: Expanded(
              child: TextField(
                textInputAction: TextInputAction.done,
                controller: _themeController,
                minLines: 1,
                maxLines: 2,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    contentPadding: EdgeInsetsDirectional.only(start: 8.w),
                    isCollapsed: true,
                    border:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Введите тему...',
                    hintMaxLines: 2,
                    hintStyle: TextStyle(
                      fontSize: 20.sp,
                    )),
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
          ),
        ),
        //зеленая карточка введите правильный ответ
      ],
    );
  }
}
