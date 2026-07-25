import 'package:lenguo_app/features/auth/domain/entity/auth_entity.dart';
import 'package:lenguo_app/features/auth/domain/repository/auth_repository.dart';

class AuthForgotPassword {
  final AuthRepository repository;
  AuthForgotPassword(this.repository);
  Future<AuthEntity> call(String email) =>
      repository.forgotPassword(email: email);
}
