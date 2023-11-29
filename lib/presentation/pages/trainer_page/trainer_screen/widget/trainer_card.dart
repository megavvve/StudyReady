import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:study_ready/domain/models/trainer.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/show_launching_trainer.dart';
import 'package:study_ready/utils/app_colors.dart';
import 'package:study_ready/utils/app_svg_assets.dart';

class TrainerCard extends StatelessWidget {
  final Trainer trainer;
  const TrainerCard({
    super.key,
    required this.trainer,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainersBloc, TrainersState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.sp,
              ),
              color: colorForCardTrainerBlue),
          padding: EdgeInsets.only(
            top: 20.h,
            left: 20.w,
            right: 20.w,
          ),
          margin: EdgeInsets.only(
            top: 26.h,
            left: 20.w,
            right: 20.w,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          16.sp,
                        ),
                        color: const Color.fromRGBO(0, 0, 0, 0.2),
                      ),
                      child: Text(
                        '${trainer.questions.length} вопросов',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    trainer.name,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                  (trainer.id==1)?'Непрерывная математика':"",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 22.sp,
                          ),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          showLaunchingTrainer(context, trainer);
                           final bloc = context.read<TrainersBloc>();
                          bloc.add(GenerateAnswersListEvent(trainer: trainer));
                        },
                        child: Text(
                          'Начнем',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      backgrondForTrainerCard,
                    ],
                  ),
                ],
              ),
              Positioned(
                  bottom: 10.0.h, right: 25.0.w, child: pictureForTrainer),
            ],
          ),
        );
      },
    );
  }
}
