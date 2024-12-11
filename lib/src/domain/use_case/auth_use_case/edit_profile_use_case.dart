import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/data/model/request/update_profile_request.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/subject_repository.dart';

import '../../../../core/api/common/api_result.dart';
import '../../../data/model/request/login_request.dart';

@injectable
class  EditProfileUseCase {
  final AuthRepository authRepository;
  EditProfileUseCase({required this.authRepository});
  Future<ApiResult<AppUserEntity>> invoke(
      {required UpdateProfileRequest updateProfileRequest}) {
    return authRepository.updateProfile(updateProfileRequest: updateProfileRequest);
  }
}
