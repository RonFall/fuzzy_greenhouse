import 'package:firebase_auth/firebase_auth.dart';

/// Сервис аутентификации Firebase
class AuthService {
  User? get user => FirebaseAuth.instance.currentUser;

  String? get userId => user?.uid;

  String? get userEmail => user?.email;

  bool get isAlreadyLoggedIn => userId != null;

  Future<UserCredential> register({required String email, required String password}) async {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> login({required String email, required String password}) async {
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logOut() async => FirebaseAuth.instance.signOut();

  /// Сравнивает ошибку, которая приходит с Firebase и возвращает строку с
  /// сообщением.
  ///
  /// [error] - ошибка из ответа по [FirebaseAuthException]
  static String mapFirebaseError(dynamic error) {
    if (error is FirebaseAuthException) {
      return switch (error.code) {
        'unknown' => 'поля с логином и/или паролем пустые!',
        'invalid-email' => 'введен неверный формат Email!',
        'user-not-found' => 'пользователь с такими данными не найден!',
        'wrong-password' => 'введен неверный Email и/или пароль',
        _ => 'не удалось авторизоваться. Попробуйте другие учетные данные.',
      };
    }

    return 'неизвестное состояние.';
  }
}
