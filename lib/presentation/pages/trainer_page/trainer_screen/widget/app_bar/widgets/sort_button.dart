import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/trainer_screen.dart';
import 'package:study_ready/utils/app_colors.dart';

class SortingFab extends StatelessWidget {
  const SortingFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        return SizedBox(
          height: 32.h,
          width: 110.w,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: trainerAppBarButtonsBackground,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.sp,
                ),
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: trainerBottomSheetBackground,
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Text(
                          "Сортировать",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text('По умолчанию'),
                        onTap: () {
                          final trainerBloc =
                              BlocProvider.of<TrainerBloc>(context);

                          trainerBloc.add(SortTrainers('default'));

                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 0),
                              pageBuilder: (_, __, ___) =>
                                  const TrainerScreen(),
                              transitionsBuilder: (_, animation, __, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: const Text('По названию тренажера'),
                        onTap: () {
                          final trainerBloc =
                              BlocProvider.of<TrainerBloc>(context);

                          trainerBloc.add(SortTrainers('name'));

                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 0),
                              pageBuilder: (_, __, ___) =>
                                  const TrainerScreen(),
                              transitionsBuilder: (_, animation, __, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: const Text('По названию предмета'),
                        onTap: () {
                          final trainerBloc =
                              BlocProvider.of<TrainerBloc>(context);

                          trainerBloc.add(
                            SortTrainers(
                              'subject',
                            ),
                          );

                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 0),
                              pageBuilder: (_, __, ___) =>
                                  const TrainerScreen(),
                              transitionsBuilder: (_, animation, __, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: const Text('По количеству вопросов'),
                        onTap: () {
                          final trainerBloc =
                              BlocProvider.of<TrainerBloc>(context);

                          trainerBloc.add(SortTrainers('count_question'));
                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 0),
                              pageBuilder: (_, __, ___) =>
                                  const TrainerScreen(),
                              transitionsBuilder: (_, animation, __, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );

                          // Получаем доступ к TrainerListProvider и вызываем updateTrainerList

                          //Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              "Сортировка",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
