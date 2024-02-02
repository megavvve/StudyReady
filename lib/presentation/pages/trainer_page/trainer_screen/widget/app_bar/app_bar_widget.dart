import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/app_bar/widgets/sort_button.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/widget/app_bar/widgets/subject_selection_fab.dart';
import 'package:study_ready/utils/app_colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: backgroundColor,
        pinned: true,
        snap: false,
        floating: true,
        surfaceTintColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
          ),
          child: IconButton(
            icon: Icon(
              Icons.menu,
              size: 40.sp,
              weight: 10.w,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 8.w,left: 8.w),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SubjectSelectionFab(),
              SortingFab(),
            ],
          ),
        ));
  }
}
