import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  User? get user => FirebaseAuth.instance.currentUser;

  String? get userId => user?.uid;

  String? get userEmail => user?.email;

  bool get isAlreadyLoggedIn => userId != null;

  Future<UserCredential> logIn({
    required String email,
    required String password,
  }) async {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logOut() async => FirebaseAuth.instance.signOut();

  static String mapFirebaseError(Object? error) {
    if (error is FirebaseAuthException) {
      if (error.code == 'unknown') {
        return 'поля с логином и/или паролем пустые!';
      }
      if (error.code == 'invalid-email') {
        return 'введен неверный формат Email!';
      }
      if (error.code == 'user-not-found') {
        return 'пользователь с такими данными не найден!';
      }
      if (error.code == 'too-many-requests') {
        return 'слишком много запросов!';
      }
      if (error.code == 'wrong-password') {
        return 'введен неверный Email и/или пароль';
      }
    }
    return 'неизвестное состояние.';
  }
}
