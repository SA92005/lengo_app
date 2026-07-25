import 'package:lenguo_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:lenguo_app/features/auth/domain/entity/auth_entity.dart';
import 'package:lenguo_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<AuthEntity> login({
    required String email,
    required String password,
  }) async {
    final authModel = await authDataSource.login(
      email: email,
      password: password,
    );

    return authModel.toEntity();
  }

  @override
  Future<AuthEntity> register({
    required String name,
    required String password,
    required String email,
  }) async {
    final authModel = await authDataSource.register(
      name: name,
      password: password,
      email: email,
    );

    return authModel.toEntity();
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    await authDataSource.forgotPassword(email: email);
  }

  @override
  Future<void> logOut() async {
    await authDataSource.logOut();
  }

  @override
  Future<AuthEntity> signInWithGoogle() {
    throw UnimplementedError();
  }
}
