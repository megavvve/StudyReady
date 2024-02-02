import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortingFab extends StatelessWidget {
  const SortingFab({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.w),
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
