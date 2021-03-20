import 'package:authentication_sample/Authentication/domain/entities/LoginData.dart';
import 'package:authentication_sample/Authentication/domain/repositories/AuthenticationRepository.dart';
import 'package:authentication_sample/core/UseCase/UseCase.dart';
import 'package:authentication_sample/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class Login implements UseCase<bool, LoginData> {
  final AuthenticationRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, bool>> call(LoginData params) {
    return repository.login(params);
  }
}
