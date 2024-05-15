import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/presentation/navigation/burger_navigation_leading.dart';
import 'package:study_ready/utils/app_colors.dart';

class AppBarAddingQuestion extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarAddingQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      floating: false,
      pinned: true,
      snap: false,
      shadowColor: Colors.transparent,
      backgroundColor: brightness == Brightness.dark
          ? backgroundColorDark
          : backgroundColorLight,
      leading: BurgerNavigationLeading(context),
      title: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          Container(
            height: 35.h,
            width: 250.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: brightness == Brightness.dark
                  ? colorForButton
                  : secondColorLight,
              borderRadius: BorderRadius.circular(6.sp),
            ),
            child: Text(
              'Новый вопрос',
              style: TextStyle(
                color:
                    brightness == Brightness.dark ? Colors.white : Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
