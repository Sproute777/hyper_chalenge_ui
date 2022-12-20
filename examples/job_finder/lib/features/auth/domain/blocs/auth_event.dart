part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class _AuthStatusChanged extends AuthEvent {
  const _AuthStatusChanged(this.status);

  final AuthStatus status;
}

class AuthLogoutRequested extends AuthEvent {}