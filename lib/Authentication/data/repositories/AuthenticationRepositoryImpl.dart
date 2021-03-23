import 'package:authentication_sample/Authentication/data/data_sources/AuthenticationLocalDataSource.dart';
import 'package:authentication_sample/Authentication/data/data_sources/AuthenticationRemoteDataSource.dart';
import 'package:authentication_sample/Authentication/data/models/ProfileModel.dart';
import 'package:authentication_sample/Authentication/domain/entities/LoginData.dart';
import 'package:authentication_sample/Authentication/domain/entities/ProfileData.dart';
import 'package:authentication_sample/Authentication/domain/repositories/AuthenticationRepository.dart';
import 'package:authentication_sample/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSourceImpl remoteDataSource;
  final AuthenticationLocalDataSourceImpl localDataSource;

  ProfileData _profileData = ProfileData(name: 'default', token: 1);
  bool _isLoggedIn = false;

  AuthenticationRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  // TODO: implement currentUser
  ProfileData get currentUser {
    return _profileData;
  }

  @override
  Future<Either<Failure, ProfileData>> getProfile(LoginData params) async {
    try {
      final ProfileModel user = await remoteDataSource.getProfileData(params);

      if (user != null) {
        return Right(
          ProfileData(name: user.name, token: user.token),
        );
      }
      return Left(ObjectNull());
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  // TODO: implement isLoggedIn
  bool get isLoggedIn {
    return _isLoggedIn;
  }

  @override
  Future<Either<Failure, bool>> login(LoginData params) async {
    try {
      final ProfileModel user = await remoteDataSource.getProfileData(params);
      _profileData = ProfileData(name: user.name, token: user.token);
      _isLoggedIn = user != null;
      await Future.delayed(const Duration(seconds: 2), () {});
      return Right(
        user != null,
      );
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  void logout() {
    if (isLoggedIn) {
      _isLoggedIn = false;
    } else {
      throw 'Log out Failed';
    }
  }
}
