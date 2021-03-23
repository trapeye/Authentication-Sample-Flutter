import 'package:authentication_sample/Authentication/domain/repositories/ValidationRepository.dart';
import 'package:authentication_sample/core/UseCase/UseCase.dart';
import 'package:authentication_sample/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class ValidationPassword implements UseCaseNoFuture<bool, String> {
  final ValidationRepository repository;

  ValidationPassword(this.repository);

  @override
  Either<Failure, bool> call(String params) {
    return repository.validationPassword(params);
  }
}
