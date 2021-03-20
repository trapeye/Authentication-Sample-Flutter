import 'package:authentication_sample/Authentication/domain/entities/LoginData.dart';
import 'package:authentication_sample/Authentication/domain/entities/ProfileData.dart';
import 'package:authentication_sample/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  ProfileData get currentUser;

  Future<Either<Failure, ProfileData>> getProfile(LoginData params);

  bool get isLoggedIn;

  Future<Either<Failure, bool>> login(LoginData params);

  void logout();
}
