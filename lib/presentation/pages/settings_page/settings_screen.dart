import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:study_ready/presentation/blocs/user_cubit/user_cubit.dart';
import 'package:study_ready/presentation/navigation/burger_navigation_leading.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/settings_page/widgets/sign_out.dart';
import 'package:study_ready/presentation/pages/settings_page/widgets/theme_switch_button.dart';
import 'package:study_ready/presentation/pages/settings_page/widgets/user_profile_widget.dart';
import 'package:study_ready/utils/app_colors.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                  // bottom: PreferredSize(
                  //   preferredSize: Size(double.infinity.w, 80.h),
                  //   child: const BottomButton(),
                  // ),
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
                            Positioned(
                                //child: ChangeDataButton(),
                                child: UserProfileWidget(
                              userModel: state.userModel,
                            )
                                //sharedPreferences.getString("uid") ?? ""),
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
                            /*Positioned(
                              top: 379.h,
                              left: 0.w,
                              right: 0.w,
                              child: const CallSupportButton(),
                            ), */
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}
