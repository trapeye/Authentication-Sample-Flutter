import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ProfileModel extends Equatable {
  final String name;
  final int token;

  ProfileModel({@required this.name, @required this.token});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      token: json['token'],
    );
  }

  @override
  List<Object> get props => [name, token];
}
