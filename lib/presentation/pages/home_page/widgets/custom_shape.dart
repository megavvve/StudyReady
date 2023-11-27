import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class CustomShapeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 452.h,
      child: CustomPaint(
        painter: CustomShapePainter(),
      ),
    );
  }
}

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFFD9D9D9)
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0.w, size.height); // начинаем с левого нижнего угла
    path.lineTo(0.w, size.height); // линия вверх на 40 пикселей
    path.lineTo(0.w, 80.h); // линия вправо на 40 пикселей
    path.lineTo(size.width.w, 0.h); // линия вверх на 40 пикселей
    path.lineTo(size.width.w, size.height - 10.h); // линия вправо на 40 пикселей
    path.lineTo(size.width.w, size.height); // линия вниз до правого нижнего угла
    path.close(); // закрываем контур

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
