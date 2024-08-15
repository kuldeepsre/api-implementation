import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/login_response.dart';
import '../../repositry/form_repository/login_repo.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  LoginBloc(this.loginRepository) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

    Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final user = await loginRepository.login(event.username, event.password);
      emit(LoginSuccess(user));
    } catch (e) {
      if (e is LoginException) {
        emit(LoginFailure(e.message));
      } else {
        emit(LoginFailure('An unexpected error occurred'));
      }
    }
  }
}
