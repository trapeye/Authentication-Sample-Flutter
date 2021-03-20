import 'package:authentication_sample/Authentication/domain/repositories/AuthenticationRepository.dart';
import 'package:authentication_sample/core/UseCase/UseCase.dart';

class Logout implements UseCaseVoid {
  final AuthenticationRepository repository;

  Logout(this.repository);

  @override
  call() {
    repository.logout();
  }
}
