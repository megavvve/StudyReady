import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/utils/app_colors.dart';

class SubjectSelectionFab extends StatelessWidget {
  const SubjectSelectionFab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        // final trainerList = state.trainerList;

        return SizedBox(
          height: 32.h,
          width: 170.w,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: trainerAppBarButtonsBackground,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.sp,
                ), // Закругление углов
              ),
            ),
            onPressed: () {
              // Получение списка предметов из тренажеров (замените этот список своим)
              List<String> subjects = ['Непрерывная математика'];

              // При нажатии на FloatingActionButton открываем нижнее диалоговое окно
              showModalBottomSheet(
                backgroundColor: trainerBottomSheetBackground,
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                        ),
                        child: Text(
                          "Выбрать предмет",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20.sp),
                        ),
                      ),
                      for (String subject in subjects)
                        ListTile(
                          title: Text(subject),
                          onTap: () {
                            // Добавьте здесь логику обработки выбора предмета
                            // Например, передайте выбранный предмет в функцию для обработки

                            Navigator.pop(context);
                          },
                        ),
                    ],
                  );
                },
              );
            },
            child: Text(
              "Выбрать предмет",
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
