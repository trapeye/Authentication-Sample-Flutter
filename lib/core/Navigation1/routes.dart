import 'package:authentication_sample/Authentication/presentation/pages/LoginScreen.dart';
import 'package:flutter/material.dart';

import '../../HomeScreen.dart';
import 'NavigatorAnimation.dart';

class Routes {
  static const String loginScreen = LoginScreen.routeName;
  static const String homeScreen = HomeScreen.routeName;

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return animationRouteAppleTransition(
          widget: LoginScreen(),
          settings: loginScreen,
        );
      case homeScreen:
        return animationRouteAppleTransition(
          widget: HomeScreen(),
          settings: homeScreen,
        );
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}
