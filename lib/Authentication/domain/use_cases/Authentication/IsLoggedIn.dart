import 'package:authentication_sample/Authentication/domain/repositories/AuthenticationRepository.dart';
import 'package:authentication_sample/core/UseCase/UseCase.dart';

class IsLoggedIn implements UseCaseGet<bool> {
  final AuthenticationRepository repository;

  IsLoggedIn(this.repository);

  @override
  bool call() {
    return repository.isLoggedIn;
  }
}
