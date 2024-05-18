import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/presentation/pages/auth_page/widgets/widget/change_notifier_for_auth.dart';
import 'package:study_ready/presentation/pages/auth_page/widgets/email_form.dart';
import 'package:study_ready/presentation/pages/auth_page/widgets/headline.dart';
import 'package:study_ready/presentation/pages/auth_page/widgets/login_form.dart';
import 'package:study_ready/presentation/pages/auth_page/widgets/next_button.dart';
import 'package:study_ready/presentation/pages/auth_page/widgets/password_form.dart';
import 'package:study_ready/utils/app_colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ChangeNotifierForAuth changeNotifierForAuth = ChangeNotifierForAuth();

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;

    return ListenableBuilder(
        listenable: changeNotifierForAuth,
        builder: (context, _) {
          return Scaffold(
            backgroundColor: brightness == Brightness.dark
                ? backgroundColorDark
                : backgroundColorLight,
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: changeNotifierForAuth.isNeedRegistry
                      ? const Headline(
                          textForHeadline: "для регистрации",
                        )
                      : const Headline(
                          textForHeadline: "для входа",
                        ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                      height: 10.h,
                    ),
                  ),
                ),
                if (changeNotifierForAuth.isNeedRegistry)
                  SliverToBoxAdapter(
                    child: Center(
                      child: Column(
                        children: [
                          LoginForm(
                            changeNotifierForAuth: changeNotifierForAuth,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                SliverToBoxAdapter(
                  child: Center(
                    child: EmailForm(
                      changeNotifierForAuth: changeNotifierForAuth,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                      height: 30.h,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: PasswordForm(
                      changeNotifierForAuth: changeNotifierForAuth,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                      height: 15.h,
                    ),
                  ),
                ),
                (changeNotifierForAuth.errorMessage != '')
                    ? SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            changeNotifierForAuth.errorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    : const SliverToBoxAdapter(child: SizedBox.shrink()),
                SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                      height: 15.h,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: NextButton(
                      changeNotifierForAuth: changeNotifierForAuth,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                      height: 15.h,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          changeNotifierForAuth.isNeedRegistry =
                              !changeNotifierForAuth.isNeedRegistry;
                          changeNotifierForAuth.errorMessage = '';
                        });
                      },
                      child: changeNotifierForAuth.isNeedRegistry
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Уже есть аккаунт? ',
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                Text(
                                  'Войти',
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.red),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Нет аккаунта? ',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  'Зарегистрироваться',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
