import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/navigation/custom_page_router.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/trainer/add_answer/add_answer_screen.dart';
import 'package:study_ready/presentation/pages/trainer/trainer_screen/widget/trainer_card.dart';
import 'package:study_ready/utils/app_colors.dart';
import 'widget/app_bar_widget.dart'; 

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
    return Scaffold(
      drawer: const NavigatorDrawer(),
      backgroundColor: backgroundColor,
      body: Stack(children: [
        CustomScrollView(
          slivers: <Widget>[
            const AppBarWidget(),
            SliverList.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) =>
                    const TrainerCard()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 22.h,
              ),
            )
          ],
        ),
        Positioned(
          bottom: 56.h,
          right: 38.w,
          child: SizedBox(
            width: 70.w,
            height: 70.h,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(customPageRoute(AddAnswerScreen()));
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
      ]),
    );
  }
}
