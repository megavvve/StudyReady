import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_colors.dart';

class SortingFab extends StatelessWidget {
  const SortingFab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: secondColor,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              6.sp,
            ), // Закругление углов
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Text(
                      "Сортировать",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                    ),
                  ),
                  ListTile(
                    title: const Text('по имени'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('по дате'),
                    onTap: () {
                      // Добавьте здесь логику сортировки по дате
                      Navigator.pop(context);
                    },
                  ),
                  // Добавьте другие варианты сортировки как ListTile
                ],
              );
            },
          );
        },
        child: Text(
          "Сортировка",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
    );
  }
}
