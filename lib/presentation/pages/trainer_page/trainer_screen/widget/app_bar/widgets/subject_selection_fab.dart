import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/bloc/trainer_bloc.dart';

class SubjectSelectionFab extends StatelessWidget {
  const SubjectSelectionFab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainersBloc, TrainersState>(
      builder: (context, state) {
        // final trainerList = state.trainerList;

        return TextButton(
          onPressed: () {
            // Получение списка предметов из тренажеров (замените этот список своим)
            List<String> subjects = ['Непрерывная математика'];

            // При нажатии на FloatingActionButton открываем нижнее диалоговое окно
            showModalBottomSheet(
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
                        "Выбрать предмет: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
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
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0.w),
            child: Text(
              "Выбрать предмет",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
