part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;
  AuthSignInEvent(this.email, this.password);
}

class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;
  AuthSignUpEvent(this.email, this.password);
}

class AuthSignInWithGoogleEvent extends AuthEvent {}

class AuthSignOutEvent extends AuthEvent {}
