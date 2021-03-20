import 'package:authentication_sample/Authentication/domain/entities/LoginData.dart';
import 'package:authentication_sample/Authentication/domain/entities/ProfileData.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/CurrentUser.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/GetProfile.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/IsLoggedIn.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/Login.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/Logout.dart';
import 'package:authentication_sample/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationProvider with ChangeNotifier {
  CurrentUser _currentUser;
  GetProfile _getProfile;
  IsLoggedIn _isLoggedIn;
  Login _login;
  Logout _logout;

  String _userName = '';
  String _password = '';

  bool _isUserNameValid = true;
  bool _isPasswordValid = true;
  bool get isUserNameValid => _isUserNameValid;
  bool get isPasswordValid => _isPasswordValid;

  String _errorTextUserName = 'error';
  String _errorTextPassword = 'error';
  String get errorTextUserName => _errorTextUserName;
  String get errorTextPassword => _errorTextPassword;

  TextEditingController _controllerUserName = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController get controllerUserName => _controllerUserName;
  TextEditingController get controllerPassword => _controllerPassword;

  AuthenticationProvider({
    @required CurrentUser currentUser,
    @required GetProfile getProfile,
    @required IsLoggedIn isLoggedIn,
    @required Login login,
    @required Logout logout,
  })  : _currentUser = currentUser,
        _getProfile = getProfile,
        _isLoggedIn = isLoggedIn,
        _login = login,
        _logout = logout;

  void changeUserName(String value) {
    if (!isPasswordValid) {}
    _userName = value;
    notifyListeners();
  }

  void changePassword(String value) {
    if (!isPasswordValid) {}
    _password = value;
    notifyListeners();
  }

  ProfileData get getCurrentUser {
    return _currentUser.call();
  }

  void getProfileData() {
    _getProfile.call(
      LoginData(userName: _userName, password: _password),
    );
  }

  bool get isLoggedIn {
    return _isLoggedIn.call();
  }

  Future<bool> get login async {
    if (_isUserNameValid && _isPasswordValid) {
      final Either<Failure, bool> result = await _login
          .call(LoginData(userName: _userName, password: _password));
      print(isLoggedIn);
      return result.fold(
        (l) => false,
        (r) => r,
      );
    } else {
      return false;
    }
  }

  void get logOut {
    _logout.call();
  }

  void get resetData {
    _userName = '';
    _password = '';

    _isUserNameValid = true;
    _isPasswordValid = true;

    _errorTextUserName = 'error';
    _errorTextPassword = 'error';

    TextEditingController _controllerUserName = TextEditingController();
    TextEditingController _controllerPassword = TextEditingController();
  }
}
