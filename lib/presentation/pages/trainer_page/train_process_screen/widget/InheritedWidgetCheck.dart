import 'package:flutter/material.dart';

class SharedState extends InheritedWidget {
  final int selectedIndex;
  final Function(int) updateSelectedIndex;

  const SharedState({super.key, 
    required this.selectedIndex,
    required this.updateSelectedIndex,
    required Widget child,
  }) : super(child: child);

  static SharedState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedState>()!;
  }

  @override
  bool updateShouldNotify(SharedState oldWidget) {
    return oldWidget.selectedIndex != selectedIndex;
  }
}
