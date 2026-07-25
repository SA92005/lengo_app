import 'package:get_it/get_it.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_forgot_password.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_log_out.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_login_usecase.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_register_usecase.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_sign_in_with_google.dart';

final sl = GetIt.instance;
// ==================
// auth use cases
// ==================
Future<void> init() async {
  sl.registerLazySingleton(() => AuthForgotPassword(sl()));
  sl.registerLazySingleton(() => AuthLogOut(sl()));
  sl.registerLazySingleton(() => AuthLoginUsecase(sl()));
  sl.registerLazySingleton(() => AuthRegisterUsecase(sl()));
  sl.registerLazySingleton(() => AuthSignInWithGoogle(sl()));
}
