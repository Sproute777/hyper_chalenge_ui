import 'dart:async';
// import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/user/user.dart';
import '../repositories/auth_repository.dart';
import '../repositories/user_repository.dart';
// import 'package:user_repository/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc
    extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository,
        super(const AuthState.unknown()) {
    on<_AuthStatusChanged>(_onAuthStatusChanged);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    _authenticationStatusSubscription = _authRepository.status.listen(
      (status) => add(_AuthStatusChanged(status)),
    );
  }

  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthStatus>
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authRepository.dispose();
    return super.close();
  }

  Future<void> _onAuthStatusChanged(
    _AuthStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    switch (event.status) {
      case AuthStatus.unauthenticated:
        return emit(const AuthState.unauthenticated());
      case AuthStatus.authenticated:
        final user = await _tryGetUser();
        return emit(
          user != null
              ? AuthState.authenticated(user)
              : const AuthState.unauthenticated(),
        );
      case AuthStatus.unknown:
        return emit(const AuthState.unknown());
    }
  }

  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) {
    _authRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}