import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/presentation/navigation/burger_navigation_leading.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/settings_page/widgets/bottom_button.dart';
import 'package:study_ready/presentation/pages/settings_page/widgets/call_support_button.dart';
import 'package:study_ready/presentation/pages/settings_page/widgets/change_data_button.dart';
import 'package:study_ready/presentation/pages/settings_page/widgets/theme_switch_button.dart';
import 'package:study_ready/utils/app_colors.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return Scaffold(
      backgroundColor: brightness == Brightness.dark
          ? backgroundColorDark
          : backgroundColorLight,
      drawer: const NavigatorDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: brightness == Brightness.dark
                ? backgroundColorDark
                : settingsAppBar,
            leading: Builder(
              builder: (BuildContext context) {
                return BurgerNavigationLeading(context);
              },
            ),
            title: const Text(
              "Настройки",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size(double.infinity.w, 80.h),
              child: const BottomButton(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Stack(
                    children: [
                      brightness == Brightness.dark
                          ? settingsBackgroundDark
                          : settingsBackgroundLight,
                      const Positioned(
                        child: ChangeDataButton(),
                      ),
                      Positioned(
                        top: 90.h,
                        left: 0.w,
                        right: 0.w,
                        child: const ThemeSwitchButton(),
                      ),
                      Positioned(
                        top: 379.h,
                        left: 0.w,
                        right: 0.w,
                        child: const CallSupportButton(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
