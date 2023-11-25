import 'package:flutter/material.dart';

class QuestionAndAnswersControllers extends InheritedWidget {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController courseNumController = TextEditingController();
  final TextEditingController moduleController = TextEditingController();
  final TextEditingController themeController = TextEditingController();
  final TextEditingController difficultController = TextEditingController();

  QuestionAndAnswersControllers({super.key, required Widget child})
      : super(child: child);

  static QuestionAndAnswersControllers? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<QuestionAndAnswersControllers>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
