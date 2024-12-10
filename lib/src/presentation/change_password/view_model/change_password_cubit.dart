import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/core/error/error_handler.dart';
import 'package:online_exam_app/core/error/error_model.dart';
import 'package:online_exam_app/src/data/model/request/change_password_request.dart';
import 'package:online_exam_app/src/presentation/change_password/view_model/change_password_action.dart';

import '../../../domain/use_case/change_password_use_case.dart';

part 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase _changePasswordUseCase;
  ChangePasswordCubit(this._changePasswordUseCase)
      : super(ChangePasswordInitial());

  TextEditingController oldPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> doAction(ChangePasswordAction changePasswordAction) async {
    switch (changePasswordAction) {
      case GetCallChangePasswordAction():
        return await _changePassword();
    }
  }

  Future<void> _changePassword() async {
    emit(ChangePasswordLoadingState());
    ChangePasswordRequest changePasswordRequest = ChangePasswordRequest(
        rePassword: rePassword.text,
        password: password.text,
        oldPassword: oldPassword.text);
    var result = await _changePasswordUseCase.invoke(
        changePasswordRequest: changePasswordRequest);
    switch (result) {
      case Success<bool>():
        emit(ChangePasswordSuccessState());
      case Failures<bool>():
        ErrorModel errorModel = ErrorHandler.formException(result.exception);
        emit(ChangePasswordFailuresState(errorModel: errorModel));
    }
  }
}
