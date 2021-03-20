import 'package:flutter/material.dart';

import 'appConfig.dart';

class MyRouteInformationParser extends RouteInformationParser<AppConfig> {
  @override
  Future<AppConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    if (uri.pathSegments.length == 0 ||
        (uri.pathSegments.length == 1 &&
            uri.pathSegments[0] == AppConfig.home().uri.pathSegments[0])) {
      return AppConfig.home();
    }

    if (uri.path == AppConfig.login().uri.path) {
      return AppConfig.login();
    }

    if (uri.path == AppConfig.attendance().uri.path) {
      return AppConfig.attendance();
    }

    return AppConfig.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(AppConfig path) {
    if (path.isUnknown) {
      return RouteInformation(location: AppConfig.unknown().uri.path);
    }
    if (path.isHomeSection) {
      return RouteInformation(location: AppConfig.home().uri.path);
    }
    if (path.isLoginSection) {
      return RouteInformation(location: AppConfig.login().uri.path);
    }
    if (path.isAttendanceSection) {
      return RouteInformation(location: AppConfig.attendance().uri.path);
    }
    return null;
  }
}
