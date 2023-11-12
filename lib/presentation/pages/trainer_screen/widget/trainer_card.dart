import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainerCard extends StatelessWidget {
  const TrainerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176.43.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.sp),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(
        top: 22.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 40.h,
            child: Text('0/30', style: TextStyle(fontSize: 16.sp)),
          ),


          SizedBox(height: 60.h,
            child: Text('Непрерывная математика', style: TextStyle(fontSize: 25.sp)),
          ),


          SizedBox(height: 20.h),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 22.sp),
            ),
            onPressed: () {},
            child: const Text('Начнем'),
          ),


        ],
      ),
    );
  }
}
