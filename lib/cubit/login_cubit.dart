import 'package:flutter_bloc/flutter_bloc.dart';

class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final String? error;

  LoginState({this.isLoading = false, this.isSuccess = false, this.error});
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void login(String username, String password) async {
    emit(LoginState(isLoading: true));
    await Future.delayed(Duration(seconds: 2)); // Simulasi proses login

    emit(LoginState(isSuccess: true));
  }
}
