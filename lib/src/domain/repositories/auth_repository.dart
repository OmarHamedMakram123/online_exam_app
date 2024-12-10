import 'package:online_exam_app/src/data/model/request/change_password_request.dart';
import 'package:online_exam_app/src/data/model/request/register_request.dart';
import 'package:online_exam_app/src/data/model/request/update_profile_request.dart';

import '../../../core/api/common/api_result.dart';
import '../../data/model/request/login_request.dart';
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
}
