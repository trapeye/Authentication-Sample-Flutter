import 'package:flutter/material.dart';

Route animationRouteScale({Widget widget, String settings}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      double begin = 0.0;
      double end = 1.0;
      var curve = Curves.fastOutSlowIn;

      var tweenScaleTransition = Tween<double>(begin: begin, end: end)
          .animate(CurvedAnimation(parent: animation, curve: curve));

      return ScaleTransition(
        scale: tweenScaleTransition,
        child: child,
      );
    },
    settings: RouteSettings(name: settings),
  );
}

Route animationRouteAppleTransition({Widget widget, String settings}) {
  return PageRouteBuilder(
    //transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.easeIn;

      var tweenScaleTransition = Tween(begin: begin, end: end)
          .animate(CurvedAnimation(parent: animation, curve: curve));

      return SlideTransition(
        position: tweenScaleTransition,
        child: child,
      );
    },
    settings: RouteSettings(name: settings),
  );
}
