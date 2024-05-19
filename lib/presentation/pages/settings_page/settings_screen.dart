import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:study_ready/presentation/blocs/user_cubit/user_cubit.dart';
import 'package:study_ready/presentation/navigation/burger_navigation_leading.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/settings_page/widgets/sign_out.dart';
import 'package:study_ready/presentation/pages/settings_page/widgets/theme_switch_button.dart';
import 'package:study_ready/utils/app_colors.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool showDuck = true;

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: brightness == Brightness.dark
              ? backgroundColorDark
              : backgroundColorLight,
          drawer: const NavigatorDrawer(),
          body: Stack(
            children: [
              Positioned(
                bottom: 0.h,
                child: !showDuck
                    ? SizedBox(
                        width: 450.w,
                        height: 650.h,
                        child: const RiveAnimation.asset(
                          'assets/rive/duck_walk.riv',
                          fit: BoxFit.cover,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              CustomScrollView(
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
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: EdgeInsets.all(16.sp),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                showDuck = !showDuck;
                              });
                            },
                            child: Stack(
                              children: [
                                brightness == Brightness.dark
                                    ? settingsBackgroundDark
                                    : settingsBackgroundLight,
                                Positioned(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(13.sp),
                                    width: 362.w,
                                    height: 90.h,
                                    decoration: BoxDecoration(
                                      color: brightness == Brightness.dark
                                          ? colorForMaterialCardDark
                                          : const Color(0xFFAEC6FF),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16.sp),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Positioned(
                                              child: duckBackground,
                                            ),
                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: duck,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${state.userModel.displayName}',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'почта: ${state.userModel.email}',
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 120.h,
                                  left: 0.w,
                                  right: 0.w,
                                  child: const ThemeSwitchButton(),
                                ),
                                Positioned(
                                  top: 450.h,
                                  left: 0.w,
                                  right: 0.w,
                                  child: const SignOutButton(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
