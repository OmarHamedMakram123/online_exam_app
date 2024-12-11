import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/data/model/request/reset_password_request.dart';
import '../../../../core/api/common/api_result.dart';
import '../../entities/success_auth_entity.dart';
import '../../repositories/auth_repository.dart';

@injectable
class ResetPasswordUseCase{
  final AuthRepository authRepository;
  ResetPasswordUseCase({required this.authRepository});
  Future<ApiResult<SuccessAuthEntity>>invoke({required ResetPasswordRequest resetPasswordRequest})async{
    return authRepository.resetPassword(resetPasswordRequest: resetPasswordRequest);
  }
}