import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  Failure([this.properties = const <dynamic>[]]);

  @override
  List<Object> get props => [properties];
}

class ValidationFailure extends Failure {
  final String errorValidationText;

  ValidationFailure(this.errorValidationText);
}

class ObjectNull extends Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
