import 'package:lenguo_app/features/auth/domain/entity/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> login({required String email, required String password});

  Future<AuthEntity> register({
    required String name,
    required String password,
    required String email,
  });

  Future<AuthEntity> signInWithGoogle();

  Future<AuthEntity> forgotPassword({required String email});

  Future<void> logOut();
}
