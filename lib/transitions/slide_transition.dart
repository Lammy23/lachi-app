import 'package:flutter/cupertino.dart';

class SlidePageTransition extends PageRouteBuilder {
  final Widget widget;

  SlidePageTransition({required this.widget})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return widget;
          },
          reverseTransitionDuration: const Duration(milliseconds: 250),
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            Animation<Offset> offsetanimation = Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
                reverseCurve: Curves.easeInOut));
            return SlideTransition(position: offsetanimation, child: child);
          },
        );
}
