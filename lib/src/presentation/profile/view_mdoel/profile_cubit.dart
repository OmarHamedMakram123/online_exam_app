import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/core/error/error_handler.dart';
import 'package:online_exam_app/core/error/error_model.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import 'package:online_exam_app/src/presentation/profile/view_mdoel/profile_action.dart';

import '../../../domain/use_case/get_profile_data_use_case.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileDataUseCase _getProfileDataUseCase;
  ProfileCubit(this._getProfileDataUseCase) : super(ProfileInitial());

  AppUserEntity? appUserEntity;
  GlobalKey<FormState>formKey=GlobalKey<FormState>();
  Future<void> doAction(ProfileAction profileAction) async {
    switch (profileAction) {
      case GetProfileDataAction():
        return await _getProfileData();
      case NavigateToChangePasswordAction():
        return _navigateToChangePassword();
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


  void _navigateToChangePassword(){
    emit(NavigateToChangePasswordState());
  }
}
