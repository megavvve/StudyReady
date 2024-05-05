import 'package:flutter/material.dart';

PageRouteBuilder routerWithoutAnimation(Widget widget) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 0),
    pageBuilder: (_, __, ___) => widget,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
