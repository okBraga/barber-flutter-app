import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService = AuthService();

  AuthBloc() : super(AuthInitial()) {
    on<AuthSignInEvent>((event, emit) async {
      emit(AuthLoading());
      final error = await _authService.signIn(event.email, event.password);
      if (error != null) {
        emit(AuthFailure(error));
      } else {
        emit(AuthSuccess());
      }
    });

    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthLoading());
      final error = await _authService.signUp(event.email, event.password);
      if (error != null) {
        emit(AuthFailure(error));
      } else {
        emit(AuthSuccess());
      }
    });

    on<AuthSignInWithGoogleEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final userCredential = await _authService.signInWithGoogle();
        if (userCredential == null) {
          emit(AuthFailure('Login com Google cancelado.'));
        } else {
          emit(AuthSuccess());
        }
      } catch (e) {
        emit(AuthFailure('Erro ao entrar com Google: $e'));
      }
    });

    on<AuthSignOutEvent>((event, emit) async {
      emit(AuthLoading());
      await _authService.signOut();
      emit(AuthInitial());
    });
  }
}
