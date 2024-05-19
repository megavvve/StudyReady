import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';

class DescriptionBackgroundRectangle extends StatelessWidget {
  const DescriptionBackgroundRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return Container(
      height: 250.h,
      width: 396.w,
      color: brightness == Brightness.dark
          ? const Color(0xFF2A42B6)
          : const Color(0xFf8A9CF2),
    );
  }
}
