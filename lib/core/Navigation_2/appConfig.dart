import 'package:equatable/equatable.dart';

class AppConfig extends Equatable {
  final Uri uri;

  AppConfig.home() : uri = Uri(path: '/test');

  AppConfig.login() : uri = Uri(path: '/login');

  AppConfig.attendance() : uri = Uri(path: '/attendance');

  AppConfig.unknown() : uri = Uri(path: "/unknown");

  bool get isHomeSection => (uri == AppConfig.home().uri);

  bool get isLoginSection => (uri == AppConfig.login().uri);

  bool get isAttendanceSection => (uri == AppConfig.attendance().uri);

  bool get isUnknown => (uri == AppConfig.unknown().uri);

  @override
  List<Object> get props => [uri.path];
}
