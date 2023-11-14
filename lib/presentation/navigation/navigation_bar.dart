import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/home_screen/home_screen.dart';
import 'package:study_ready/utils/app_colors.dart';
import 'package:study_ready/utils/navigation_bar/drawer_utils.dart';

class NavigatorDrawer extends StatelessWidget {
  const NavigatorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 222.w,
      backgroundColor: backgroundColor,
      child: Container(
        padding: EdgeInsets.only(
          top: 50.sp,
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
            const Divider(
              color: Colors.black,
              indent: 20,
              endIndent: 30,
            ),
          ],
        ),
      ),
    );
  }
}
