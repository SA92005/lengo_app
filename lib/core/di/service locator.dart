import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:lenguo_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:lenguo_app/features/auth/data/data_source/auth_data_source_impl.dart';
import 'package:lenguo_app/features/auth/data/reposatory/auth_repositorr_impl.dart';
import 'package:lenguo_app/features/auth/domain/repository/auth_repository.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_forgot_password.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_log_out.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_login_usecase.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_register_usecase.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_sign_in_with_google.dart';
import 'package:lenguo_app/features/auth/presentation/cubit/auth_cubit.dart';

final sl = GetIt.instance;
// ===============================================================
// auth
// ===============================================================

//authusecase
Future<void> init() async {
  sl.registerLazySingleton(() => AuthForgotPassword(sl()));
  sl.registerLazySingleton(() => AuthLogOut(sl()));
  sl.registerLazySingleton(() => AuthLoginUsecase(sl()));
  sl.registerLazySingleton(() => AuthRegisterUsecase(sl()));
  sl.registerLazySingleton(() => AuthSignInWithGoogle(sl()));

  //firebase
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  //data source
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl(sl()));

  //repo
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  //cubit
  sl.registerFactory(
    () => AuthCubit(
      loginUseCase: sl(),
      registerUseCase: sl(),
      forgotPasswordUseCase: sl(),
      logOutUseCase: sl(),
      signInWithGoogleUseCase: sl(),
    ),
  );
}
