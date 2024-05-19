import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/pages/home_page/widgets/custom_shape_materials.dart';
import 'package:study_ready/presentation/pages/materials_page/materials_screen.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class MaterialsButton extends StatelessWidget {
  const MaterialsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(
          customPageRoute(
            const MaterialScreen(),
          ),
        );
      },
      padding: EdgeInsets.all(0.sp),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: Stack(
        children: [
          const MaterialsCustomShapeWidget(),
          Positioned(
            left: 39.w,
            bottom: 50.h,
            child: rLetterBack,
          ),
          Positioned(
            left: 49.w,
            bottom: 50.h,
            child: rLetterFront,
          ),
          Positioned(
            left: 140.w,
            bottom: 192.25.h,
            child: materialsText,
          ),
          Positioned(
            left: 161.23.w,
            bottom: 148.41.h,
            child: eadyText,
          ),
          //Container(height: 200.h, color: Colors.grey,),
        ],
      ),
    );
  }
}
