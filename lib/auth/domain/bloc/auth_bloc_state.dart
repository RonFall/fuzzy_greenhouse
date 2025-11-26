part of 'auth_bloc.dart';

sealed class AuthBlocState with EquatableMixin {
  const AuthBlocState();

  @override
  List<Object?> get props => [];
}

final class AuthBlocStateNotInitialized extends AuthBlocState {
  const AuthBlocStateNotInitialized();
}

final class AuthBlocStateLoading extends AuthBlocState {
  const AuthBlocStateLoading();
}

final class AuthBlocStateError extends AuthBlocState {
  const AuthBlocStateError({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}

final class AuthBlocStateData extends AuthBlocState {
  const AuthBlocStateData({required this.user});

  final User? user;

  @override
  List<Object?> get props => [user];
}
