import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_ready/presentation/pages/first_screen/widgets/main_form.dart';
import 'package:study_ready/presentation/pages/first_screen/widgets/next_button.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF0FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MainForm(),
            SizedBox(
              height: 10.h,
            ),
            const NextButton(),
          ],
        ),
      ),
    );
  }
}
