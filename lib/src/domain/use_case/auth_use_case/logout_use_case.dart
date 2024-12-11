import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/domain/repositories/auth_repository.dart';

import '../../../../core/api/common/api_result.dart';
@injectable
class LogoutUseCase{
  final AuthRepository authRepository;
  LogoutUseCase({required this.authRepository});
  Future<ApiResult<bool>>invoke()async{
    return authRepository.logOut();
  }
}