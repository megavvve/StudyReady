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
          padding: EdgeInsets.only(
            left: 20.w,
          ),
          child: IconButton(
            icon: Icon(
              Icons.menu,
              size: 40.sp,
              weight: 10.w,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 5.w,),
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return {'Непрерывная математика',}.map((String choice) {
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
                  child: Row(
                    children: [
                      Text(
                        'Выбор Предмета',
                        style: TextStyle(color: Colors.black, fontSize: 13.sp),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black, size: 15.sp,),
                    ],
                  ),
                ),
              ),
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return {'По умолчанию'}
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
                  child: Row(
                    children: [
                      Text(
                        'Сортировка',
                        style: TextStyle(color: Colors.black, fontSize: 13.sp),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black, size: 15.sp,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
