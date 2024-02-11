// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/blocs/trainer_bloc/trainer_bloc.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/add_question_screen.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/trainer_card.dart';
import 'package:study_ready/utils/app_colors.dart';
import 'widget/app_bar/app_bar_widget.dart';

class TrainerScreen extends StatefulWidget {
  const TrainerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TrainerScreen> createState() => _TrainerScreenState();
}

class _TrainerScreenState extends State<TrainerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        List<Trainer> trainerList = state.trainerList;
        return Scaffold(
          drawer: const NavigatorDrawer(),
          backgroundColor: backgroundColor,
          body: Stack(
            children: [
              Positioned.fill(
                child: CustomScrollView(
                  slivers: <Widget>[
                    const AppBarWidget(),
                    SliverList.builder(
                      itemCount: trainerList.length,
                      itemBuilder: (BuildContext context, int index) =>
                          TrainerCard(
                        trainer: trainerList[index],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 30.h,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 56.h,
                right: 38.w,
                child: SizedBox(
                  width: 70.w,
                  height: 70.h,
                  child: FittedBox(
                    child: FloatingActionButton(
                      onPressed: () async {
                        await Navigator.of(context).push(
                          customPageRoute(
                            const AddQustionScreen(),
                          ),
                        );
                        setState(() {
                          trainerList = state.trainerList;
                        });
                      },
                      backgroundColor: Colors.white,
                      child: const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
