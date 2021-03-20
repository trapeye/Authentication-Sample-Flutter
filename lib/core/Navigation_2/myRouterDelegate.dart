/*
import 'package:flutter/material.dart';

import 'appConfig.dart';

class MyRouterDelegate extends RouterDelegate<AppConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppConfig> {
  final GlobalKey<NavigatorState> navigatorKey;

  AppConfig currentState = AppConfig.home();
  AppConfig previousState;
  // for pop on User Page, to possibly go back to a specific book

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    assert(AppConfig.home() == this.currentState);
  }

  List<Page<dynamic>> buildPage() {
    List<Page<dynamic>> pages = [];
    pages.add(
      MaterialPage(
        key: ValueKey('HomePage'),
        child: HomeScreen(),
      ),
    );
    */
/*if (currentState.uri.pathSegments[0] ==
        AppConfig.login().uri.pathSegments[0]) {
      pages.add(
          MaterialPage(key: ValueKey('LoginScreen'), child: LoginScreen()));
    } else if (currentState.uri.pathSegments[0] ==
        AppConfig.attendance().uri.pathSegments[0]) {
      pages.add(
        MaterialPage(
          key: ValueKey('LoginScreen'),
          child: AttendanceScreen(),
        ),
      );
    }*/ /*

    if (currentState.isUnknown)
      pages.add(
          MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen()));
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      //transitionDelegate: AnimationTransitionDelegate(),
      pages: buildPage(),
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        } else if (currentState.uri.path == AppConfig.home().uri.path) {
          currentState = previousState;
          previousState = null;
        } else if (currentState.uri.path == AppConfig.login().uri.path) {
          currentState = previousState;
          previousState = null;
        } else if (currentState.uri.path == AppConfig.attendance().uri.path) {
          currentState = previousState;
          previousState = null;
        } else {
          currentState = AppConfig.unknown();
        }
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppConfig newState) async {
    currentState = newState;
    return;
  }

  void handleHomeTapped() {
    previousState = currentState;
    currentState = AppConfig.home();
    notifyListeners();
  }

  void handleLoginTapped() {
    previousState = currentState;
    currentState = AppConfig.login();
    notifyListeners();
  }

  void handleAttendanceTapped() {
    previousState = currentState;
    currentState = AppConfig.attendance();
    notifyListeners();
  }
}
*/
