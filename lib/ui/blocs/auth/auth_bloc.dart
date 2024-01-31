import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot_doctor/domain/auth/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;

  AuthBloc(this.authUseCase) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignInEvent) {
        emit(AuthLoading());
        final result = await authUseCase.signInWithEmailAndPassword(
            event.email, event.password);
        emit(result.fold(
            (error) => AuthFailure(error), (user) => AuthSuccess(user!)));
      } else if (event is SignUpEvent) {
        emit(AuthLoading());
        final result = await authUseCase.signUpWithEmailAndPassword(
            event.email, event.password);
        emit(result.fold(
            (error) => AuthFailure(error), (user) => AuthSuccess(user!)));
      } else if (event is SignOutEvent) {
        emit(AuthLoading());
        await authUseCase.signOut();
        emit(AuthInitial());
      } else if (event is CheckAuthStatusEvent) {
        emit(AuthLoading());
        final result = await authUseCase.checkAuthState();
        emit(result.fold(
            (error) => AuthInitial(), (user) => AuthSuccess(user!)));
      }
    });
  }
}
