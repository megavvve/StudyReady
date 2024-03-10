import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/materials_page/widgets/card_info_page.dart';

class MaterialCard extends StatelessWidget {
  final String topic;
  final String text;

  const MaterialCard({
    required this.topic,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardInfo(
              topic: topic,
              text: text,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8.sp),
        padding: EdgeInsets.all(8.sp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.sp),
          color: Colors.white,
        ),
        width: 147.w,
        height: 191.h,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 8,
        ),
      ),
    );
  }
}
