import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:lenguo_app/core/errors/exceptions.dart';
import 'package:lenguo_app/core/errors/firebase_error_maper.dart';
import 'package:lenguo_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:lenguo_app/features/auth/data/models/auth_model.dart';

@Injectable(as: AuthDataSource)
@lazySingleton
class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth firebaseAuth;

  AuthDataSourceImpl(this.firebaseAuth);

  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return AuthModel.fromFirebase(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: FirebaseErrorMaper.map(e.code));
    }
  }

  @override
  Future<AuthModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(name);

      return AuthModel.fromFirebase(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: FirebaseErrorMaper.map(e.code));
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: FirebaseErrorMaper.map(e.code));
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: FirebaseErrorMaper.map(e.code));
    }
  }

  @override
  Future<AuthModel> signInWithGoogle() {
    throw UnimplementedError();
  }
}

@module
abstract class FirebaseModule {
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}
