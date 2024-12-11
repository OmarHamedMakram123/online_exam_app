import 'package:online_exam_app/src/data/model/request/change_password_request.dart';
import 'package:online_exam_app/src/data/model/request/register_request.dart';
import 'package:online_exam_app/src/data/model/request/update_profile_request.dart';
import 'package:online_exam_app/src/domain/entities/success_auth_entity.dart';

import '../../../core/api/common/api_result.dart';
import '../../data/model/request/forget_password_request.dart';
import '../../data/model/request/login_request.dart';
import '../../data/model/request/reset_password_request.dart';
import '../../data/model/request/verify_reset_code_request.dart';
import '../entities/app_user_entity.dart';

abstract class AuthRepository {
  Future<ApiResult<AppUserEntity>> login({required LoginRequest loginRequest});
  Future<ApiResult<AppUserEntity>> register(
      {required RegisterRequest registerRequest});

  Future<ApiResult<AppUserEntity>> getProfileData();
  Future<ApiResult<AppUserEntity>> updateProfile({
    required UpdateProfileRequest updateProfileRequest
});
  Future<ApiResult<bool>> changePassword({required ChangePasswordRequest changePasswordRequest});
  Future<ApiResult<SuccessAuthEntity>>forgetPassword({required ForgetPasswordRequest forgetPasswordRequest});
  Future<ApiResult<SuccessAuthEntity>>resetPassword({required ResetPasswordRequest resetPasswordRequest});
  Future<ApiResult<SuccessAuthEntity>>verifyResetCode({required VerifyResetCodeRequest verifyRestCode});
  Future<ApiResult<bool>>logOut();
}
