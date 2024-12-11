import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/data/api/api_manger.dart';
import 'package:online_exam_app/src/data/model/request/change_password_request.dart';
import 'package:online_exam_app/src/data/model/request/forget_password_request.dart';
import 'package:online_exam_app/src/data/model/request/login_request.dart';
import 'package:online_exam_app/src/data/model/request/register_request.dart';
import 'package:online_exam_app/src/data/model/request/reset_password_request.dart';
import 'package:online_exam_app/src/data/model/request/update_profile_request.dart';
import 'package:online_exam_app/src/data/model/request/verify_reset_code_request.dart';
import 'package:online_exam_app/src/data/model/response/app_user_model/app_user_model.dart';
import 'package:online_exam_app/src/data/model/response/forget_password_response/forget_password_response_model.dart';
import 'package:online_exam_app/src/data/model/response/success_auth_reponse_model/success_auth_response_model.dart';
import 'auth_online_data_source.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  final ApiManger _apiManger;
  AuthOnlineDataSourceImpl(this._apiManger);
  @override
  Future<AppUserModel> login(LoginRequest loginRequest) async {
    return await _apiManger.login(loginRequest);
  }

  @override
  Future<AppUserModel> register(RegisterRequest registerRequest) async {
    return await _apiManger.register(registerRequest);
  }

  @override
  Future<AppUserModel> getProfileDate() async {
    return await _apiManger.getLoggedUserInfo();
  }

  @override
  Future<AppUserModel> updateProfile(
      {required UpdateProfileRequest updateProfileRequest}) async {
    return await _apiManger.updateProfileData(
        updateProfileRequest: updateProfileRequest);
  }

  @override
  Future<SuccessAuthResponseModel> changePassword(
      {required ChangePasswordRequest changePasswordRequest}) async {
    return await _apiManger.changePassword(
        changePasswordRequest: changePasswordRequest);
  }

  @override
  Future<ForgetPasswordResponseModel> forgetPassword(
      {required ForgetPasswordRequest forgetPasswordRequest}) {
    return _apiManger.forgetPassword(
        forgetPasswordRequest: forgetPasswordRequest);
  }

  @override
  Future<String> logOut() {
    return _apiManger.logoOut();
  }

  @override
  Future<SuccessAuthResponseModel> resetPassword(
      {required ResetPasswordRequest resetPasswordRequest}) {
    return _apiManger.resetPassword(resetPasswordRequest: resetPasswordRequest);
  }

  @override
  Future<SuccessAuthResponseModel> verifyResetCode(
      {required VerifyResetCodeRequest verifyRestCode}) {
    return _apiManger.verifyResetCode(verifyRestCode: verifyRestCode);
  }
}
