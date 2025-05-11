import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
  }

  Future<void> login() async {
    emit(AuthLoading());
    try {
      // Simulate a network call
      await Future.delayed(Duration(seconds: 1));
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure());
    }
  }
}
