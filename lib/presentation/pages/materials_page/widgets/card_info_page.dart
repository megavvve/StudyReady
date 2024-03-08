import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardInfo extends StatelessWidget {
  final String topic;
  final String text;
  const CardInfo({super.key, required this.topic, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF0FF),
      body: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.sp),
              color: const Color(0xFF5B94F1),
            ),
            width: 373.w,
            height: 63.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: Text(
                      topic,
                      style: TextStyle(fontSize: 25.sp),
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Container(
              margin: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.sp),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(8.sp),
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}
