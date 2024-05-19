import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';

import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/delete_mode_for_trainers.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/widget_of_trainer_list_widget.dart/delete_confirm.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/widget_of_trainer_list_widget.dart/show_launching_trainer.dart';
import 'package:study_ready/presentation/widgets/shaking_animation.dart';
import 'package:study_ready/utils/app_svg_assets.dart';
import 'package:study_ready/utils/custom_tooltip.dart';

class TrainerCard extends StatefulWidget {
  final Trainer trainer;
  final DeleteModeForTrainers deleteMode;
  const TrainerCard({
    super.key,
    required this.trainer,
    required this.deleteMode,
  });

  static String getRandomColorForCard() {
    const List<String> colors = [
      "0xFF7C97FF",
      "0xFF9496F4",
      "0xFFF67791",
      "0xFFE3945F",
    ];
    return colors[Random().nextInt(3)];
  }

  @override
  State<TrainerCard> createState() => _TrainerCardState();
}

class _TrainerCardState extends State<TrainerCard> {
  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<ThemeCubit>().state.brightness;
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        return ShakingAnimation(
          isActive: widget.deleteMode.isDeleting,
          child: GestureDetector(
              onLongPress: () {
                widget.deleteMode.isDeleting = true;
              },
              onTap: () {
                if (widget.deleteMode.isDeleting) {
                  showDeleteConfirmirm(
                      context, widget.deleteMode, widget.trainer);
                }
              },
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        16.sp,
                      ),
                      color: (widget.trainer.color != null)
                          ? Color(int.parse(widget.trainer.color!))
                              .withOpacity(0.85)
                          : Color(
                              int.parse(
                                TrainerCard.getRandomColorForCard(),
                              ),
                            ).withOpacity(0.85),
                    ),
                    padding: EdgeInsets.only(
                      top: 20.h,
                      left: 20.w,
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
                              child: Padding(
                                padding: EdgeInsets.only(right: 20.w),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      16.sp,
                                    ),
                                    color: const Color.fromRGBO(0, 0, 0, 0.2),
                                  ),
                                  child: Text(
                                    '${widget.trainer.questions.length} вопросов',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              widget.trainer.trainerName,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              widget.trainer.subjectName,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OverlayTooltipItem(
                                  displayIndex: 4,
                                  tooltip: (controller) {
                                    return MTooltip(
                                      tooltipKey: 'materials_helper_disabled',
                                      title: 'Кнопка "Начнем"',
                                      description:
                                          "Нажмите, чтобы запустить тренажер.",
                                      controller: controller,
                                    );
                                  },
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                        fontSize: 22.sp,
                                      ),
                                      backgroundColor: brightness ==
                                              Brightness.dark
                                          ? const Color.fromRGBO(0, 0, 0, 0.2)
                                          : Colors.white,
                                    ),
                                    onPressed: () {
                                      showLaunchingTrainer(
                                          context, widget.trainer);
                                      final bloc = context.read<TrainerBloc>();
                                      bloc.add(
                                        GenerateAnswersListEvent(
                                          trainerList:
                                              (state is TrainerLoadSuccess)
                                                  ? state.trainerList
                                                  : [],
                                          trainer: widget.trainer,
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Начнем',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: brightness == Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                backgrondsForTrainerCard[Random().nextInt(3)],
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (widget.deleteMode.isDeleting)
                    Positioned(
                      top: 20.h,
                      right: 15.w,
                      child: Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                          border: Border.all(color: Colors.red),
                        ),
                        child: const Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                ],
              )),
        );
      },
    );
  }
}
