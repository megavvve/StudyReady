import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/home_screen/home_screen.dart';

class NavigatorDrawer extends StatelessWidget {
  const NavigatorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 222.w,
      backgroundColor: const Color.fromRGBO(189, 214, 255, 1),
      child: Container(
        padding: EdgeInsets.only(
          top: 50.sp,
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(
                Icons.home_outlined,
                size: 35.sp,
                color: Colors.black,
              ),
              title: Text(
                'Главная',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              trailing: Icon(
                Icons.chevron_right_sharp,
                size: 35.sp,
                color: Colors.black,
              ),
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
            )
          ],
        ),
      ),
    );
  }
}
