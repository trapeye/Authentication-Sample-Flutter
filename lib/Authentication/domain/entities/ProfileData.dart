import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ProfileData extends Equatable {
  final String name;
  final int token;

  ProfileData({
    @required this.name,
    @required this.token,
  });

  @override
  List<Object> get props => [];
}
