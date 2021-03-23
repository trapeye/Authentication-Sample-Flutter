import 'package:authentication_sample/Authentication/domain/repositories/ValidationRepository.dart';
import 'package:authentication_sample/core/Validator/string_validators.dart';
import 'package:authentication_sample/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class ValidationRepositoryImpl implements ValidationRepository {
  @override
  Either<Failure, bool> validationPassword(String value) {
    bool notEmpty = NonEmptyStringValidator().isValid(value);
    bool oneUpper = RegexOneUpperCase().isValid(value);
    bool oneLower = RegexOneLowerCase().isValid(value);
    bool oneDigit = RegexOneDigit().isValid(value);
    bool oneSpecialChar = RegexOneSpecialCharacter().isValid(value);

    if (notEmpty) {
      if (!oneUpper) {
        return Left(ValidationFailure('Need at least one upper case'));
      } else if (!oneLower) {
        return Left(ValidationFailure('Need at least one lower case'));
      } else if (!oneDigit) {
        return Left(ValidationFailure('Need at least one digit'));
      } else if (!oneSpecialChar) {
        return Left(ValidationFailure('Need at least one special character'));
      } else {
        return Right(true);
      }
    } else {
      return Left(ValidationFailure('Password is empty'));
    }
  }

  @override
  Either<Failure, bool> validationUserName(String value) {
    if (NonEmptyStringValidator().isValid(value)) {
      return Right(true);
    } else {
      return Left(ValidationFailure('User name is empty'));
    }
  }
}
