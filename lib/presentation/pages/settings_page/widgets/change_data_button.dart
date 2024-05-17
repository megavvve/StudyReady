import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeDataButton extends StatelessWidget {
  const ChangeDataButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                "В доработке...",
                style: TextStyle(fontSize: 20.sp),
              ),
            );
          },
        );
        
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.sp),
        width: 362.w,
        height: 70.h,
        decoration: BoxDecoration(
          color: const Color(0xFFAEC6FF),
          borderRadius: BorderRadius.all(
            Radius.circular(16.sp),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Изменить данные",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              width: 40.w,
            ),
            Icon(
              Icons.arrow_right,
              size: 40.sp,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
