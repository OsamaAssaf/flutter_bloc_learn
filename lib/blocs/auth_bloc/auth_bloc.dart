import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((AuthEvent event, Emitter<AuthState> emit) async {
      if (event is LoginEvent) {
        await login(event, emit);
      }
    });
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      event.email;
      event.password;
      // Simulate a network call
      await Future.delayed(Duration(seconds: 1));
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure());
    }
  }
}
