import 'package:lenguo_app/features/auth/domain/entity/auth_entity.dart';
import 'package:lenguo_app/features/auth/domain/repository/auth_repository.dart';

class AuthRegisterUsecase {
  final AuthRepository repository;
  AuthRegisterUsecase(this.repository);
  Future<AuthEntity> call({
    required String name,
    required String email,
    required String password,
  }) => repository.register(name: name, password: password, email: email);
}
