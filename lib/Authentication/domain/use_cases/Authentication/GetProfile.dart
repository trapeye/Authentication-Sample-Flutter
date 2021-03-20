import 'package:authentication_sample/Authentication/domain/entities/LoginData.dart';
import 'package:authentication_sample/Authentication/domain/entities/ProfileData.dart';
import 'package:authentication_sample/Authentication/domain/repositories/AuthenticationRepository.dart';
import 'package:authentication_sample/core/UseCase/UseCase.dart';
import 'package:authentication_sample/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetProfile implements UseCase<ProfileData, LoginData> {
  final AuthenticationRepository repository;

  GetProfile(this.repository);
  @override
  Future<Either<Failure, ProfileData>> call(LoginData params) {
    return repository.getProfile(params);
  }
}
