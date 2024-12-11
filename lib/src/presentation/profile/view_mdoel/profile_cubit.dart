import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/core/error/error_handler.dart';
import 'package:online_exam_app/core/error/error_model.dart';
import 'package:online_exam_app/src/data/model/request/update_profile_request.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import 'package:online_exam_app/src/domain/use_case/auth_use_case/logout_use_case.dart';
import 'package:online_exam_app/src/presentation/profile/view_mdoel/profile_action.dart';

import '../../../domain/use_case/auth_use_case/edit_profile_use_case.dart';
import '../../../domain/use_case/auth_use_case/get_profile_data_use_case.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileDataUseCase _getProfileDataUseCase;
  final LogoutUseCase _logoutUseCase;
  final EditProfileUseCase _updateProfileUseCase;
  ProfileCubit(this._updateProfileUseCase, this._getProfileDataUseCase,
      this._logoutUseCase)
      : super(ProfileInitial());

  AppUserEntity? appUserEntity;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> doAction(ProfileAction profileAction) async {
    switch (profileAction) {
      case GetProfileDataAction():
        return await _getProfileData();
      case NavigateToChangePasswordAction():
        return _navigateToChangePassword();
      case LogoutButtonAction():
        return await _logout();
      case NavigateToLoginScreenAction():
        return _navigateToLogin();
      case ChangeFormFieldAction():
        return _changeFormField(profileAction.isFormField);
      case UpdateProfileButtonAction():
        return await _updateProfile();
    }
  }

  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> _updateProfile() async {
    UpdateProfileRequest updateProfileRequest = UpdateProfileRequest(
        username: userNameController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        phone: phoneController.text);
    emit(UpdateProfileLoadingState());
    var result = await _updateProfileUseCase.invoke(
        updateProfileRequest: updateProfileRequest);
    switch (result) {
      case Success<AppUserEntity>():
        emit(UpdateProfileSuccessState());
      case Failures<AppUserEntity>():
        ErrorModel errorModel = ErrorHandler.formException(result.exception);
        emit(UpdateProfileFailuresState(errorModel: errorModel));
    }
  }

  Future<void> _getProfileData() async {
    emit(GetProfileDataLoadingState());
    var result = await _getProfileDataUseCase.invoke();
    switch (result) {
      case Success<AppUserEntity>():
        appUserEntity = result.date;
        emit(GetProfileDataSuccessState());
      case Failures<AppUserEntity>():
        ErrorModel errorModel = ErrorHandler.formException(result.exception);
        emit(GetProfileDataFailuresState(errorModel: errorModel));
    }
  }

  Future<void> _logout() async {
    emit(LogoutLoadingState());
    var result = await _logoutUseCase.invoke();
    switch (result) {
      case Success<bool>():
        emit(LogoutSuccessState());
      case Failures<bool>():
        ErrorModel errorModel = ErrorHandler.formException(result.exception);
        emit(LogoutFailuresState(errorModel: errorModel));
    }
  }

  void _popularField(TextEditingController controller, String? value) {
    controller.text = controller.text.isEmpty ? value ?? "" : controller.text;
  }

  void profilePopularFields({required AppUserEntity userEntity}) {
    _popularField(userNameController, userEntity.username);
    _popularField(firstNameController, userEntity.firstName);
    _popularField(lastNameController, userEntity.lastName);
    _popularField(emailController, userEntity.email);
    _popularField(phoneController, userEntity.phone);
  }

  void resetFormField() {
    userNameController.text = "";
    firstNameController.text = "";
    lastNameController.text = "";
    emailController.text = "";
    phoneController.text = "";
  }

  bool isFormField = false;
  void _changeFormField(bool change) {
    if (isFormField == change) return;
    isFormField = change;
    emit(ChangeFormFiledState());
  }

  void _navigateToChangePassword() {
    emit(NavigateToChangePasswordState());
  }

  void _navigateToLogin() {
    emit(NavigateToLoginState());
  }

  String titleAppBar() {
    if (!isFormField) {
      return "Profile";
    } else {
      return "Update";
    }
  }
}
