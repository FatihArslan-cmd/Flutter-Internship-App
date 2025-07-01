import 'package:flutter/material.dart';

PageRoute<T> buildScaleFadeTransitionRoute<T>(Widget page, { Duration? transitionDuration, Duration? reverseTransitionDuration }) {
  return PageRouteBuilder<T>(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const beginScale = 0.9;
      const endScale = 1.0;   
      const curve = Curves.easeInOut;

      var scaleTween = Tween(begin: beginScale, end: endScale).chain(CurveTween(curve: curve));
      var fadeTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));


      return ScaleTransition(
        scale: animation.drive(scaleTween), 
        child: FadeTransition(
          opacity: animation.drive(fadeTween), 
          child: child, 
        ),
      );
    },
    transitionDuration: transitionDuration ?? const Duration(milliseconds: 300),
    reverseTransitionDuration: reverseTransitionDuration ?? const Duration(milliseconds: 300),
  );
}