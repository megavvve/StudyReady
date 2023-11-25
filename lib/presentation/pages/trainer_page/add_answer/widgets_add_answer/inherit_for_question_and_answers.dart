import 'package:flutter/material.dart';

class QuestionControllers extends InheritedWidget {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController1 = TextEditingController();
  final TextEditingController answerController2 = TextEditingController();
  final TextEditingController answerController3 = TextEditingController();
  final TextEditingController answerController4 = TextEditingController();

  QuestionControllers({super.key, required Widget child}) : super(child: child);

  static QuestionControllers? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<QuestionControllers>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
