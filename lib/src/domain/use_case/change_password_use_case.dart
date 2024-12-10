import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/request/change_password_request.dart';
import '../repositories/auth_repository.dart';

@injectable
class ChangePasswordUseCase{
  final AuthRepository authRepository;
  ChangePasswordUseCase({required this.authRepository});

  Future<ApiResult<bool>>invoke({required ChangePasswordRequest changePasswordRequest})async{
    return await  authRepository.changePassword(changePasswordRequest: changePasswordRequest);
  }
}