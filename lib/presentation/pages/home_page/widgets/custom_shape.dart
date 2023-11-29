import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShapeWidget extends StatelessWidget {
  const CustomShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
      ..color = const Color(0xFFD9D9D9)
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0.w, size.height); // начинаем с левого нижнего угла
    path.lineTo(0.w, size.height); // линия вверх на 40 пикселей
    path.lineTo(0.w, 90.h); // линия вправо на 40 пикселей
    path.lineTo(size.width.w + 150.h, 0.h); // линия вверх на 40 пикселей
    path.lineTo(size.width.w + 150.h,
        size.height - 10.h); // линия вправо на 40 пикселей
    path.lineTo(size.width.w + 150.h,
        size.height); // линия вниз до правого нижнего угла
    path.close(); // закрываем контур

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
