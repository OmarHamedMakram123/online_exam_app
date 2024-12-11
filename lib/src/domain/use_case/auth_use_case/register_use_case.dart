import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/data/model/request/register_request.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import '../../repositories/auth_repository.dart';

import '../../../../core/api/common/api_result.dart';

@injectable
class RegisterUseCase {
  final AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});
  Future<ApiResult<AppUserEntity>> invoke(
      {required RegisterRequest registerRequest}) {
    return authRepository.register(registerRequest: registerRequest);
  }
}
