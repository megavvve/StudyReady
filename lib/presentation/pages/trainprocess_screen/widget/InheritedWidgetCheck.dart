import 'package:flutter/cupertino.dart';

class InheritedWidgetDemo extends InheritedWidget {
  int selectedAnswer;

  InheritedWidgetDemo({
    required Widget child,
    this.selectedAnswer = -1,
  }) : super(child: child);

  static InheritedWidgetDemo? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedWidgetDemo>();
  }

  @override
  bool updateShouldNotify(InheritedWidgetDemo oldWidget) {
    //return selectedAnswer != oldWidget.selectedAnswer;
    return true;
  }
}
