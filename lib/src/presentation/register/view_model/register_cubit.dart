import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import 'package:online_exam_app/src/presentation/register/view_model/register_action.dart';

import '../../../../core/api/common/api_result.dart';
import '../../../../core/error/error_handler.dart';
import '../../../data/model/request/register_request.dart';
import '../../../domain/use_case/auth_use_case/register_use_case.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  TextEditingController userNameController =
      TextEditingController();
  TextEditingController firstName =
  TextEditingController();
  TextEditingController lastName =
  TextEditingController();
  TextEditingController phoneController =
      TextEditingController();
  TextEditingController emailController =
      TextEditingController();
  TextEditingController passwordController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void doAction(RegisterAction registerAction) async {
    switch (registerAction) {
      case NavigateToLoginAction():
        return _navigateToLoginView();
      case NavigateToMainAction():
        return _navigateToMainView();
      case RegisterButtonClickAction():
        return await _register();
    }
  }

  Future<void> _register() async {
    emit(RegisterLoadingState());
    var registerRequest = RegisterRequest(
        firstName: firstName.text,
        lastName: lastName.text,
        username: userNameController.text,
        phone: phoneController.text,
        email: emailController.text,
        password: passwordController.text,
        rePassword: passwordController.text);
    var result = await registerUseCase.invoke(registerRequest: registerRequest);
    switch (result) {
      case Success<AppUserEntity>():
        emit(RegisterSuccessState());
      case Failures<AppUserEntity>():
        emit(RegisterErrorState(
            errorMassage:
                ErrorHandler.formException(result.exception).errorMassage));
    }
  }

  void _navigateToMainView() {
    emit(NavigateToMainViewState());
  }

  void _navigateToLoginView() {
    emit(NavigateToLoginState());
  }
}
