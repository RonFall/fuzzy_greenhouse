part of 'auth_bloc.dart';

sealed class AuthBlocEvent with EquatableMixin {
  const AuthBlocEvent();

  @override
  List<Object?> get props => [];
}

final class AuthBlocEventRegister extends AuthBlocEvent {
  const AuthBlocEventRegister({required this.email, required this.password, this.name, this.photoURL});

  final String email;
  final String password;
  final String? name;
  final String? photoURL;

  @override
  List<Object?> get props => [email, password, name, photoURL];
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
