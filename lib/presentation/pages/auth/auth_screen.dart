import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:study_ready/presentation/pages/auth/widgets/change_notifier_for_auth.dart';
import 'package:study_ready/presentation/pages/auth/widgets/email_form.dart';
import 'package:study_ready/presentation/pages/auth/widgets/headline.dart';
import 'package:study_ready/presentation/pages/auth/widgets/login_form.dart';
import 'package:study_ready/presentation/pages/auth/widgets/next_button.dart';
import 'package:study_ready/presentation/pages/auth/widgets/password_form.dart';
import 'package:study_ready/utils/app_colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isNeedRegistry = false;
  final ChangeNotifierForAuth changeNotifierForAuth = ChangeNotifierForAuth();
  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;

    //final User? user = Auth().currentUser;

    return ListenableBuilder(
        listenable: changeNotifierForAuth,
        builder: (context, _) {
          return Scaffold(
            backgroundColor: brightness == Brightness.dark
                ? backgroundColorDark
                : backgroundColorLight,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  isNeedRegistry
                      ? const Headline(
                          textForHeadline: "для регистрации",
                        )
                      : const Headline(
                          textForHeadline: "для входа",
                        ),
                  SizedBox(
                    height: 10.h,
                  ),
                  isNeedRegistry
                      ? Column(
                          children: [
                            LoginForm(
                              changeNotifierForAuth: changeNotifierForAuth,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                  EmailForm(
                    changeNotifierForAuth: changeNotifierForAuth,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  PasswordForm(
                    changeNotifierForAuth: changeNotifierForAuth,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  NextButton(
                    changeNotifierForAuth: changeNotifierForAuth,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  //const SkipButton(),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        isNeedRegistry = !isNeedRegistry;
                      });
                    },
                    child: isNeedRegistry
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
                                'Нет аккаута? ',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Text(
                                'Зарегистрироваться',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.red),
                              ),
                            ],
                          ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
