import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/request/update_profile_request.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import 'package:online_exam_app/src/domain/repositories/auth_repository.dart';

@injectable
class UpdateProfileUseCase{
  final AuthRepository authRepository;
  UpdateProfileUseCase({required this.authRepository});
  Future<ApiResult<AppUserEntity>>invoke({required UpdateProfileRequest updateProfileRequest})async{
    return await authRepository.updateProfile(updateProfileRequest: updateProfileRequest);
  }
}