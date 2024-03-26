import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_colors.dart';

class SortingFab extends StatelessWidget {
  const SortingFab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      width: 110.w,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: trainerAppBarButtonsBackground,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10.sp,
            ), // Закругление углов
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: trainerBottomSheetBackground,
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
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20.sp),
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
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black),
        ),
      ),
    );
  }
}
