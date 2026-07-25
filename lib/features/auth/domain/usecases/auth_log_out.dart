import 'package:lenguo_app/features/auth/domain/repository/auth_repository.dart';

class AuthLogOut {
  final AuthRepository repository;
  AuthLogOut(this.repository);

  Future<void> call() => repository.logOut();
}
