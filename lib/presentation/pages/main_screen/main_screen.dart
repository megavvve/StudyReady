import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/navigator_bar/navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Builder(
        builder: (BuildContext context) {
          return SizedBox(
            width: 34,
            height: 26,
            child: IconButton(
              icon: const Icon(Icons.menu, size: 40, weight: 10,),
              onPressed: () { Scaffold.of(context).openDrawer();},
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          );
        }),
      ),
      drawer: const NavigatorDrawer(),
      body: Center(
        child: Stack(
          children: <Widget>[
            Text(
              "StudyReady",
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
