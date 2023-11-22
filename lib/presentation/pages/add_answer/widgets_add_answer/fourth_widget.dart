import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FourthWidget extends StatefulWidget {
  const FourthWidget({super.key});

  @override
  State<FourthWidget> createState() => _FourthWidgetState();
}

class _FourthWidgetState extends State<FourthWidget> {
  final _fourthWidgetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      alignment: Alignment.centerLeft,
      width: 309.w,
      height: 113.h,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(198, 216, 245, 1),
          borderRadius: BorderRadius.circular(16.sp)),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 39.w,
            height: 34.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.sp)),
            child: Text('4', style: TextStyle(fontSize: 18.sp)),
          ),
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: _fourthWidgetController,
              minLines: 1,
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  contentPadding: EdgeInsetsDirectional.only(start: 8.w),
                  isCollapsed: true,
                  border:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Введите ответ...',
                  hintMaxLines: 2,
                  hintStyle: TextStyle(
                    fontSize: 18.sp,
                  )),
              style: TextStyle(fontSize: 18.sp),
            ),
          )
        ],
      ),
    );
  }
}
