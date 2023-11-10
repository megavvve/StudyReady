import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor,
        pinned: true,
        snap: true,
        floating: true,
        surfaceTintColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Icon(
            Icons.menu,
            size: 30.sp,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return {'непра', 'дискра', 'аиг'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: null,
                  child: const Row(
                    children: [
                      Text(
                        'Выбор Предмета',
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black),
                    ],
                  ),
                ),
              ),
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return {'Тренировка 1', 'Тренировка 2', 'Тренировка 3'}
                      .map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: null,
                  child: const Row(
                    children: [
                      Text(
                        'Сортировка',
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
