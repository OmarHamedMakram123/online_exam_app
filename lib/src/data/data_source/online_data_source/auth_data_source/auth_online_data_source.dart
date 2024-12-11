import 'package:online_exam_app/src/data/model/request/forget_password_request.dart';
import 'package:online_exam_app/src/data/model/request/register_request.dart';
import 'package:online_exam_app/src/data/model/request/reset_password_request.dart';
import 'package:online_exam_app/src/data/model/request/update_profile_request.dart';
import 'package:online_exam_app/src/data/model/request/verify_reset_code_request.dart';

import '../../../model/request/change_password_request.dart';
import '../../../model/request/login_request.dart';
import '../../../model/response/app_user_model/app_user_model.dart';
import '../../../model/response/forget_password_response/forget_password_response_model.dart';
import '../../../model/response/success_auth_reponse_model/success_auth_response_model.dart';

abstract class AuthOnlineDataSource{
  Future<AppUserModel>login(LoginRequest loginRequest);
  Future<AppUserModel>register(RegisterRequest registerRequest);
  Future<AppUserModel>getProfileDate();
  Future<AppUserModel>updateProfile({required UpdateProfileRequest updateProfileRequest});
  Future<SuccessAuthResponseModel> changePassword({required ChangePasswordRequest changePasswordRequest});
  Future<ForgetPasswordResponseModel>forgetPassword({required ForgetPasswordRequest forgetPasswordRequest});
  Future<SuccessAuthResponseModel>verifyResetCode({required VerifyResetCodeRequest verifyRestCode});
  Future<SuccessAuthResponseModel>resetPassword({required ResetPasswordRequest resetPasswordRequest});
 Future<String>logOut();
}