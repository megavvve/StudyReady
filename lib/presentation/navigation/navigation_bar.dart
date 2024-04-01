import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/delete_trainer/delete_trainer_screen.dart';
import 'package:study_ready/presentation/pages/home_page/home_screen.dart';
import 'package:study_ready/presentation/pages/materials_page/materials_screen.dart';
import 'package:study_ready/presentation/pages/trainer_page/add_question/add_question_screen/add_question_screen.dart';
import 'package:study_ready/presentation/pages/trainer_page/trainer_screen/trainer_screen.dart';
import 'package:study_ready/utils/app_colors.dart';
import 'package:study_ready/utils/navigation_bar/drawer_utils.dart';

class NavigatorDrawer extends StatelessWidget {
  const NavigatorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240.w,
      backgroundColor: burgerBackground,
      child: Container(
        padding: EdgeInsets.only(
          top: 45.h,
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: mainIcon,
              title: mainTitle,
              trailing: trailingIcon,
              onTap: () => Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  transitionDuration: Duration.zero,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const HomeScreen();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return child;
                  },
                ),
              ),
            ),
            divider,
            ListTile(
              leading: materialIcon,
              title: materialTitle,
              trailing: trailingIcon,
              onTap: () => Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  transitionDuration: Duration.zero,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const MaterialScreen();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return child;
                  },
                ),
              ),
            ),
            divider,
            ListTile(
              leading: trainerIcon,
              title: trainerTitle,
              trailing: trailingIcon,
              onTap: () => Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  transitionDuration: Duration.zero,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const TrainerScreen();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return child;
                  },
                ),
              ),
            ),
            divider,
            ListTile(
              leading: addQuestionIcon,
              title: addQuestionTitle,
              trailing: trailingIcon,
              onTap: () => Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  transitionDuration: Duration.zero,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const AddQustionScreen();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return child;
                  },
                ),
              ),
            ),
            divider,
            // ListTile(
            //   leading: addQuestionIcon,
            //   title: addQuestionTitle,
            //   trailing: trailingIcon,
            //   onTap: () => Navigator.of(context).pushReplacement(
            //     PageRouteBuilder(
            //       transitionDuration: Duration.zero,
            //       pageBuilder: (context, animation, secondaryAnimation) {
            //         return const DeleteTrainerScreen();
            //       },
            //       transitionsBuilder:
            //           (context, animation, secondaryAnimation, child) {
            //         return child;
            //       },
            //     ),
            //   ),
            // ),
            // divider,
          ],
        ),
      ),
    );
  }
}
