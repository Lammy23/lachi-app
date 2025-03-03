import 'package:flutter/material.dart';

class FadePageTransition extends PageRouteBuilder {
  final Widget widget;

  FadePageTransition({required this.widget})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 700),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
                reverseCurve: Curves.easeInOut);
            return FadeTransition(opacity: animation, child: child);
          },
        );
}
