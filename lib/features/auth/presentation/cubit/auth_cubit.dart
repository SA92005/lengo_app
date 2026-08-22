import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lenguo_app/core/errors/exceptions.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_forgot_password.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_log_out.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_login_usecase.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_register_usecase.dart';
import 'package:lenguo_app/features/auth/domain/usecases/auth_sign_in_with_google.dart';
import 'package:lenguo_app/features/auth/presentation/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthLoginUsecase loginUseCase;
  final AuthRegisterUsecase registerUseCase;
  final AuthForgotPassword forgotPasswordUseCase;
  final AuthLogOut logOutUseCase;
  final AuthSignInWithGoogle signInWithGoogleUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.forgotPasswordUseCase,
    required this.logOutUseCase,
    required this.signInWithGoogleUseCase,
  }) : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    try {
      final user = await loginUseCase(email: email, password: password);

      emit(AuthSuccess(user));
    } on ServerException catch (e) {
      emit(AuthError(e.message));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());
    try {
      final user = await registerUseCase(
        email: email,
        name: name,
        password: password,
      );
      emit(AuthSuccess(user));
    } on ServerException catch (e) {
      emit(AuthError(e.message));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> forgetPassword({required String email}) async {
    emit(AuthLoading());
    try {
      await forgotPasswordUseCase(email);
      emit(ForgotPasswordSuccess());
    } on ServerException catch (e) {
      emit(AuthError(e.message));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logOut() async {
    emit(AuthLoading());
    try {
      await logOutUseCase();
      emit(LogoutSuccess());
    } on ServerException catch (e) {
      emit(AuthError(e.message));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());

    try {
      final user = await signInWithGoogleUseCase();

      emit(AuthSuccess(user));
    } on ServerException catch (e) {
      emit(AuthError(e.message));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
