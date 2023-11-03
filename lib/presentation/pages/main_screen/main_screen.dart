import 'package:flutter/material.dart';

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
    return  const Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Text(
              "StudyReady",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
