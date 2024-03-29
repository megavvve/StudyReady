import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/domain/entities/trainer.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/add_question_screen.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/app_bar/widgets/sort_button.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/app_bar/widgets/subject_selection_fab.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/trainer_card.dart';
import 'package:study_ready/utils/app_colors.dart';

class TrainerListWidget extends StatelessWidget {
  final List<Trainer> trainerList;

  const TrainerListWidget({
    Key? key,
    required this.trainerList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigatorDrawer(),
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: backgroundColor,
                  pinned: true,
                  snap: false,
                  floating: true,
                  surfaceTintColor: secondColor,
                  centerTitle: true,
                  title: const SortingFab(),
                ),
                //   title: const Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     mainAxisSize: MainAxisSize.max,
                //     children: [
                //       // SubjectSelectionFab(),
                //       SortingFab(),
                //     ],
                //   ),
                // ),
                SliverList.builder(
                  itemCount: trainerList.length,
                  itemBuilder: (BuildContext context, int index) => TrainerCard(
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
                    await Navigator.of(context).pushReplacement(
                      customPageRoute(
                        const AddQustionScreen(),
                      ),
                    );
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
  }
}
