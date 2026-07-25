import 'package:lenguo_app/features/auth/domain/entity/auth_entity.dart';
import 'package:lenguo_app/features/auth/domain/repository/auth_repository.dart';

class AuthSignInWithGoogle {
  final AuthRepository repository;
  AuthSignInWithGoogle(this.repository);
  Future<AuthEntity> call() => repository.signInWithGoogle();
}
