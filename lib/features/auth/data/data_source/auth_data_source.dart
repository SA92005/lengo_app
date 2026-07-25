import 'package:lenguo_app/features/auth/data/models/auth_model.dart';
import 'package:lenguo_app/features/auth/domain/entity/auth_entity.dart';

abstract class AuthDataSource {
  Future<AuthModel> login({required String email, required String password});

  Future<AuthModel> register({
    required String name,
    required String password,
    required String email,
  });

  Future<AuthModel> signInWithGoogle();

  Future<void> forgotPassword({required String email});

  Future<void> logOut();
}
