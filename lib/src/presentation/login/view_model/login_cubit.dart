import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/core/error/error_handler.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import 'package:online_exam_app/src/presentation/login/view_model/login_action.dart';

import '../../../data/model/request/login_request.dart';
import '../../../domain/use_case/login_use_case.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> doAction(LoginAction loginActionView) async {
    switch (loginActionView) {
      case ButtonLoginAction():
        return await _login();
      case NavigateToForgetPasswordScreenAction():
        return _navigateToForgetPasswordScreen();
      case NavigateToBaseScreenAction():
        return _navigateToBaseScreen();
      case NavigateToRegisterScreenAction():
        return _navigateToRegisterScreen();
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState>formKey=GlobalKey<FormState>();


  Future<void> _login() async {
    emit(LoginLoadingState());
    LoginRequest loginRequest = LoginRequest(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    var result = await loginUseCase.invoke(loginRequest: loginRequest);
    switch (result) {
      case Success<AppUserEntity>():
        emit(LoginSuccessState());
      case Failures<AppUserEntity>():
        emit(LoginFailuresState(
            errorMassage:
                ErrorHandler.formException(result.exception).errorMassage));
    }
  }

  void _navigateToRegisterScreen() {
    emit(NavigateToRegisterScreenState());
  }

  void _navigateToBaseScreen() {
    emit(NavigateToBaseScreenState());
  }

  void _navigateToForgetPasswordScreen() {
    emit(NavigateToForgetPasswordScreenState());
  }
}
