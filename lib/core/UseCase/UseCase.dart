import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseNoFuture<Type, Params> {
  Either<Failure, Type> call(Params params);
}

abstract class UseCaseCustom<Type, Type2, Params> {
  Either<Type, Type2> call(Params params);
}

abstract class UseCaseGet<Type> {
  Type call();
}

abstract class UseCaseVoid {
  call();
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
