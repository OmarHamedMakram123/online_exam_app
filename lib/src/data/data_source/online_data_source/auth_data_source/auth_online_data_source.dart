import 'package:online_exam_app/src/data/model/request/register_request.dart';
import 'package:online_exam_app/src/data/model/request/update_profile_request.dart';

import '../../../model/request/change_password_request.dart';
import '../../../model/request/login_request.dart';
import '../../../model/response/app_user_model/app_user_model.dart';
import '../../../model/response/success_auth_reponse_model/success_response_model.dart';

abstract class AuthOnlineDataSource{
  Future<AppUserModel>login(LoginRequest loginRequest);
  Future<AppUserModel>register(RegisterRequest registerRequest);
  Future<AppUserModel>getProfileDate();
  Future<AppUserModel>updateProfile({required UpdateProfileRequest updateProfileRequest});
  Future<SuccessResponseModel> changePassword({required ChangePasswordRequest changePasswordRequest});

}