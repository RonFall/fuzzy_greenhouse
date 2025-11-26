part of 'auth_bloc.dart';

sealed class AuthBlocEvent with EquatableMixin {
  const AuthBlocEvent();

  @override
  List<Object?> get props => [];
}

final class AuthBlocEventLogin extends AuthBlocEvent {
  const AuthBlocEventLogin({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

final class AuthBlocEventLogout extends AuthBlocEvent {
  const AuthBlocEventLogout();
}
