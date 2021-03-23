import 'package:authentication_sample/Authentication/domain/entities/LoginData.dart';
import 'package:authentication_sample/Authentication/domain/entities/ProfileData.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/CurrentUser.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/GetProfile.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/IsLoggedIn.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/Login.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Authentication/Logout.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Validation/ValidationPassword.dart';
import 'package:authentication_sample/Authentication/domain/use_cases/Validation/ValidationUserName.dart';
import 'package:authentication_sample/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationProvider with ChangeNotifier {
  CurrentUser _currentUser;
  GetProfile _getProfile;
  IsLoggedIn _isLoggedIn;
  Login _login;
  Logout _logout;

  ValidationPassword _validationPassword;
  ValidationUserName _validationUserName;

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
    @required ValidationPassword validationPassword,
    @required ValidationUserName validationUserName,
  })  : _currentUser = currentUser,
        _getProfile = getProfile,
        _isLoggedIn = isLoggedIn,
        _login = login,
        _logout = logout,
        _validationPassword = validationPassword,
        _validationUserName = validationUserName;

  void changeUserName(String value) {
    if (!isUserNameValid) {
      validUserName(value);
    }
    _userName = value;
    notifyListeners();
  }

  void changePassword(String value) {
    if (!isPasswordValid) {
      validPassword(value);
    }
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
    _password = 'Abc@123';
    _userName = 'admin';
    validPassword(_password);
    validUserName(_userName);
    notifyListeners();
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

  void validUserName(String value) {
    final Either<Failure, bool> result = _validationUserName.call(value);

    result.fold(
      (l) {
        _isUserNameValid = false;
        _errorTextUserName = (l as ValidationFailure).errorValidationText;
      },
      (r) {
        _isUserNameValid = r;
        _errorTextUserName = null;
      },
    );
  }

  void validPassword(String value) {
    final Either<Failure, bool> result = _validationPassword.call(_password);

    result.fold(
      (l) {
        _isPasswordValid = false;
        _errorTextPassword = (l as ValidationFailure).errorValidationText;
      },
      (r) {
        _isPasswordValid = r;
        _errorTextPassword = null;
      },
    );
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

    _controllerUserName = TextEditingController();
    _controllerPassword = TextEditingController();
  }
}
