import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:study_ready/utils/app_colors.dart';

class TrainerCustomShapeWidget extends StatelessWidget {
  const TrainerCustomShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return SizedBox(
      width: 375.w,
      height: 360.h,
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
          ? backgroundColorDark
          : backgroundColorLight
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0.w, 0.h);
    path.lineTo(0.w, size.height.h);
    path.lineTo(size.width.w, size.height.h - 90);
    path.lineTo(size.width.w, 0.h);
    /*
    path.moveTo(0.w, 0.h); // начинаем с левого верхнего угла
    path.lineTo(0.w, -60.h); // линия вверх на 40 пикселей
    path.lineTo(0.w, -60.h); // линия вправо на 40 пикселей
    path.lineTo(size.width.w - 150.h, 0.h); // линия вверх на 40 пикселей
    path.lineTo(size.width.w - 150.h,
        size.height + 10.h); // линия вправо на 40 пикселей
    path.lineTo(size.width.w - 150.h,
        size.height); // линия вниз до правого нижнего угла
    path.close(); // закрываем контур
    */
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
