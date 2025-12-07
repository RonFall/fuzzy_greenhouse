import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy_greenhouse/auth/data/repositories/auth_service.dart';

part 'auth_bloc_event.dart';

part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc({required AuthService service})
    : _service = service,
      super(service.isAlreadyLoggedIn ? AuthBlocStateData(user: service.user!) : AuthBlocStateNotInitialized()) {
    on<AuthBlocEventRegister>(_register);
    on<AuthBlocEventLogin>(_login);
    on<AuthBlocEventDeleteAccount>(_deleteAccount);
    on<AuthBlocEventLogout>(_logout);
  }

  final AuthService _service;

  Future<void> _register(AuthBlocEventRegister event, Emitter<AuthBlocState> emit) async {
    if (state is AuthBlocStateLoading) return;

    try {
      emit(AuthBlocStateLoading());

      final response = await _service.register(email: event.email, password: event.password);
      if ((event.name?.isNotEmpty ?? false) || (event.photoURL?.isNotEmpty ?? false)) {
        await response.user?.updateProfile(displayName: event.name, photoURL: event.photoURL);
      }
      final user = response.user;
      if (user == null) {
        emit(AuthBlocStateUserNotFound());
      } else {
        emit(AuthBlocStateData(user: user));
      }
    } catch (e, s) {
      emit(AuthBlocStateError(error: e));

      if (e is Exception) {
        addError(e, s);

        return;
      }

      rethrow;
    }
  }

  Future<void> _login(AuthBlocEventLogin event, Emitter<AuthBlocState> emit) async {
    if (state is AuthBlocStateLoading) return;

    try {
      emit(AuthBlocStateLoading());

      final response = await _service.login(email: event.email, password: event.password);
      final user = response.user;
      if (user == null) {
        emit(AuthBlocStateUserNotFound());
      } else {
        emit(AuthBlocStateData(user: user));
      }
    } catch (e, s) {
      emit(AuthBlocStateError(error: e));

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
      emit(AuthBlocStateUserLogout());
    } catch (e, s) {
      emit(AuthBlocStateError(error: e));

      if (e is Exception) {
        addError(e, s);

        return;
      }

      rethrow;
    }
  }

  Future<void> _deleteAccount(AuthBlocEventDeleteAccount event, Emitter<AuthBlocState> emit) async {
    if (state is AuthBlocStateLoading) return;

    try {
      emit(AuthBlocStateLoading());

      await _service.deleteAccount();
      emit(AuthBlocStateUserDeleted());
    } catch (e, s) {
      emit(AuthBlocStateError(error: e));

      if (e is Exception) {
        addError(e, s);

        return;
      }

      rethrow;
    }
  }
}
