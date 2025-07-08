import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;

  AuthCubit(this.authService) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final userId = await authService.login(email, password);
      emit(AuthSuccess(userId));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register(String name, String surname, String phoneNumber, String email, String password) async {
    emit(AuthLoading());
    try {
      final userId = await authService.register(name, surname, phoneNumber, email, password);
      emit(AuthSuccess(userId));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    await authService.logout();
    emit(AuthInitial());
  }
}
