import 'package:firebase_auth/firebase_auth.dart';
import 'package:lenguo_app/features/auth/domain/entity/auth_entity.dart';

class AuthModel {
  final String id;
  final String? name;
  final String email;
  const AuthModel({required this.email, required this.id, required this.name});

  factory AuthModel.fromFirebase(User user) =>
      AuthModel(email: user.email ?? "", id: user.uid, name: user.displayName);

  factory AuthModel.fromEntity(AuthEntity entity) {
    return AuthModel(email: entity.email, id: entity.id, name: entity.name);
  }

  AuthEntity toEntity() => AuthEntity(email: email, id: id, name: name);
}
