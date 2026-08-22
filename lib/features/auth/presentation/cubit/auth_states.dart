import 'package:lenguo_app/features/auth/domain/entity/auth_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthEntity user;

  AuthSuccess(this.user);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class ForgotPasswordSuccess extends AuthState {}

class LogoutSuccess extends AuthState {}
