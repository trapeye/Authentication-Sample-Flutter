import 'package:authentication_sample/Authentication/domain/entities/ProfileData.dart';
import 'package:authentication_sample/Authentication/domain/repositories/AuthenticationRepository.dart';
import 'package:authentication_sample/core/UseCase/UseCase.dart';

class CurrentUser implements UseCaseGet<ProfileData> {
  final AuthenticationRepository repository;

  CurrentUser(this.repository);
  @override
  ProfileData call() {
    return repository.currentUser;
  }
}
