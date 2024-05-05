import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_strings.dart';

void messAboutFeatureImprovements(BuildContext context) {
 showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'В разработке',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0.sp,
                ),
              ),
              SizedBox(height: 12.0.h),
              Text(
                messageAboutDevelopThisThing,
                style: TextStyle(fontSize: 16.0.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0.sp),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
