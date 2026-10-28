import 'package:injectable/injectable.dart';
import 'package:lenguo_app/core/errors/exceptions.dart';
import 'package:lenguo_app/core/errors/failures.dart';
import 'package:lenguo_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:lenguo_app/features/auth/domain/entity/auth_entity.dart';
import 'package:lenguo_app/features/auth/domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<AuthEntity> login({
    required String email,
    required String password,
  }) async {
    try {
      final authModel = await authDataSource.login(
        email: email,
        password: password,
      );

      return authModel.toEntity();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<AuthEntity> register({
    required String name,
    required String password,
    required String email,
  }) async {
    try {
      final authModel = await authDataSource.register(
        name: name,
        password: password,
        email: email,
      );

      return authModel.toEntity();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    try {
      await authDataSource.forgotPassword(email: email);
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await authDataSource.logOut();
    } on ServerException catch (e) {
      throw ServerFailure(message: e.message);
    }
  }

  @override
  Future<AuthEntity> signInWithGoogle() {
    throw UnimplementedError();
  }
}
