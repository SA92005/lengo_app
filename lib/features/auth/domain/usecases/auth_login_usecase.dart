import 'package:lenguo_app/features/auth/domain/entity/auth_entity.dart';
import 'package:lenguo_app/features/auth/domain/repository/auth_repository.dart';

class AuthLoginUsecase {
  final AuthRepository repository;
  AuthLoginUsecase(this.repository);
  Future<AuthEntity> call({required String email, required String password}) =>
      repository.login(email: email, password: password);
}
