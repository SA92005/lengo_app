import 'package:lenguo_app/features/auth/domain/repository/auth_repository.dart';

class AuthForgotPassword {
  final AuthRepository repository;
  AuthForgotPassword(this.repository);
  Future<void> call(String email) => repository.forgotPassword(email: email);
}
