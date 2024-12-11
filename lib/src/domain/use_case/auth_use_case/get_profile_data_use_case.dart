import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';

import '../../../../core/api/common/api_result.dart';
import '../../repositories/auth_repository.dart';

@injectable
class GetProfileDataUseCase{
  final AuthRepository authRepository;
  GetProfileDataUseCase({required this.authRepository});

 Future<ApiResult<AppUserEntity>>invoke()async{
   return authRepository.getProfileData();
 }
}