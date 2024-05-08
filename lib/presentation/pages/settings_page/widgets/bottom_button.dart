import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_colors.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

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
        padding: EdgeInsets.all(8.sp),
        color: mainColorLight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Positioned(
                  child: duckBackground,
                ),
                Positioned(
                  top: 15,
                  left: 10,
                  child: duck,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Войти или",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                ),
                Text(
                  "зарегистрироваться",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
