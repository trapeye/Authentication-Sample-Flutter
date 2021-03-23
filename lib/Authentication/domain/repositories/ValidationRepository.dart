import 'package:authentication_sample/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ValidationRepository {
  Either<Failure, bool> validationUserName(String value);
  Either<Failure, bool> validationPassword(String value);
}
