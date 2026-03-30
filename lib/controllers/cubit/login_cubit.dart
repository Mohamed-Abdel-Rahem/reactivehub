import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String userName, String password) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 2));
    if (userName == "admin" && password == "admin") {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure(message: "Invalid username or password"));
    }
  }
}
