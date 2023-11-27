import 'package:flutter/material.dart';

class SharedState extends InheritedWidget {
  final int selectedIndex;
  final int selectedQuestion;
  final int howmuchQuestion; // СКОЛЬКО ВСЕГО ВОПРОСОВ В НАШЕМ КОНКРЕТНОМ ТРЕНАЖОРЕ
  final Function(int) updateSelectedIndex;
  final Function(int) updateselectedQuestion;

  const SharedState({super.key,
    required this.selectedIndex,
    required this.updateSelectedIndex,
    required this.selectedQuestion,
    required this.updateselectedQuestion,
    required this.howmuchQuestion,
    required Widget child,
  }) : super(child: child);

  static SharedState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedState>()!;
  }

  @override
  bool updateShouldNotify(SharedState oldWidget) {
    return true;
    //return oldWidget.selectedIndex != selectedIndex;
  }
}
