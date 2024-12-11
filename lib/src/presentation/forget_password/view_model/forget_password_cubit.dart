import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/core/error/error_handler.dart';
import 'package:online_exam_app/core/error/error_model.dart';
import 'package:online_exam_app/src/data/model/request/forget_password_request.dart';
import 'package:online_exam_app/src/domain/entities/success_auth_entity.dart';
import 'package:online_exam_app/src/presentation/forget_password/view_model/forget_password_action.dart';

import '../../../domain/use_case/auth_use_case/forget_password_use_case.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  ForgetPasswordCubit(this._forgetPasswordUseCase)
      : super(ForgetPasswordInitial());

  Future<void> doAction(ForgetPasswordAction forgetPasswordAction) async {
    switch (forgetPasswordAction) {
      case OnClickForgetPasswordAction():
        return await _forgetPassword();
      case NavigateVerifyResetCodeScreenAction():
        return _navigateToVerifyResetCode();
    }
  }

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> _forgetPassword() async {
    emit(ForgetPasswordLoadingState());
    ForgetPasswordRequest forgetPasswordRequest =
        ForgetPasswordRequest(email: emailController.text);
    var result = await _forgetPasswordUseCase.invoke(
        forgetPasswordRequest: forgetPasswordRequest);
    switch (result) {
      case Success<SuccessAuthEntity>():
        emit(ForgetPasswordSuccessState(
            massage: result.date.massage ?? "info OTP sent to your email"));
      case Failures<SuccessAuthEntity>():
        final errorModel = ErrorHandler.formException(result.exception);
        emit(ForgetPasswordErrorState(errorModel: errorModel));
    }
  }

  void _navigateToVerifyResetCode() {
    emit(NavigateToVerifyResetCodeState());
  }
}
