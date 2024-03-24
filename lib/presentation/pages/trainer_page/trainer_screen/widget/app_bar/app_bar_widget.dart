import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/app_bar/widgets/sort_button.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/app_bar/widgets/subject_selection_fab.dart';
import 'package:study_ready/presentation/navigation/burger_navigation_leading.dart';
import 'package:study_ready/utils/app_colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: secondColor,
      pinned: true,
      snap: false,
      floating: true,
      surfaceTintColor: secondColor,
      leading: BurgerNavigationLeading(context),
      title: Padding(
        padding: EdgeInsets.only(right: 8.0.w),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SubjectSelectionFab(),
            SortingFab(),
          ],
        ),
      ),
    );
  }
}
