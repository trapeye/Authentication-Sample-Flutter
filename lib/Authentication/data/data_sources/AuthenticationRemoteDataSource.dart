import 'dart:convert';

import 'package:authentication_sample/Authentication/data/models/ProfileModel.dart';
import 'package:authentication_sample/Authentication/domain/entities/LoginData.dart';
import 'package:authentication_sample/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSource {
  Future<ProfileModel> getProfileData(LoginData loginData);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  @override
  Future<ProfileModel> getProfileData(LoginData loginData) {
    return _exampleLogin(loginData);
  }

  Future<ProfileModel> _exampleLogin(LoginData loginData) async {
    if (loginData.userName == 'admin' && loginData.password == 'Abc@123') {
      return ProfileModel(name: 'Syazwan', token: 1);
    } else {
      throw ServerException();
    }
  }

  Future<ProfileModel> _loginApi(Uri url, LoginData login) async {
    Map<String, dynamic> formMap = {
      'username': login.userName,
      'password': login.password,
    };

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: formMap,
    );

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
