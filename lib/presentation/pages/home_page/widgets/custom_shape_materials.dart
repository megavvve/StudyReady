import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';

class MaterialsCustomShapeWidget extends StatelessWidget {
  const MaterialsCustomShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return SizedBox(
      width: 375.w,
      height: 452.h,
      child: CustomPaint(
        painter: CustomShapePainter(brightness),
      ),
    );
  }
}

class CustomShapePainter extends CustomPainter {
  final Brightness brightness;

  const CustomShapePainter(this.brightness);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = brightness == Brightness.dark
          ? const Color(0xFF6D84C8)
          : const Color(0xFFd9d9d9)
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0.w, size.height.h);
    path.lineTo(0.w, 85.h);
    path.lineTo(size.width.w + 20.h, 0.h);
    path.lineTo(size.width.w + 150.h, size.height.h);
    path.lineTo(size.width.w + 150.h, size.height.h);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
