import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class LoginData extends Equatable {
  final String userName;
  final String password;

  LoginData({
    @required this.userName,
    @required this.password,
  });

  @override
  // TODO: implement props
  List<Object> get props => [userName, password];
}
