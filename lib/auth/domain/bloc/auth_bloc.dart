import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy_greenhouse/auth/data/repositories/auth_service.dart';

part 'auth_bloc_event.dart';

part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc({required AuthService service})
    : _service = service,
      super(service.isAlreadyLoggedIn ? AuthBlocStateData(user: service.user) : AuthBlocStateNotInitialized()) {
    on<AuthBlocEventLogin>(_login);
    on<AuthBlocEventLogout>(_logout);
  }

  final AuthService _service;

  Future<void> _login(AuthBlocEventLogin event, Emitter<AuthBlocState> emit) async {
    if (state is AuthBlocStateLoading) return;

    try {
      emit(AuthBlocStateLoading());

      final response = await _service.logIn(email: event.email, password: event.password);
      emit(AuthBlocStateData(user: response.user));
    } catch (e, s) {
      emit(AuthBlocStateError(error: e.toString()));

      if (e is Exception) {
        addError(e, s);

        return;
      }

      rethrow;
    }
  }

  Future<void> _logout(AuthBlocEventLogout event, Emitter<AuthBlocState> emit) async {
    if (state is AuthBlocStateLoading) return;

    try {
      emit(AuthBlocStateLoading());

      await _service.logOut();
      emit(AuthBlocStateData(user: null));
    } catch (e, s) {
      emit(AuthBlocStateError(error: e.toString()));

      if (e is Exception) {
        addError(e, s);

        return;
      }

      rethrow;
    }
  }
}
