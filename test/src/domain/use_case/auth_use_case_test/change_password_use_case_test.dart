import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/request/change_password_request.dart';
import 'package:online_exam_app/src/domain/repositories/auth_repository.dart';
import 'package:online_exam_app/src/domain/use_case/auth_use_case/change_password_use_case.dart';
import 'package:test/test.dart';

import '../mocked/moked_repository.mocks.dart';

void main() {
  test('should return Success<AppUserEntity> when call auhRepository.changePassword is Successfully', () async{
    ChangePasswordRequest changePasswordRequest=ChangePasswordRequest(oldPassword: "",password: "",rePassword: "");
    var mockedResult=Success<bool>(date: true);
    provideDummy<ApiResult<bool>>(mockedResult);
    AuthRepository authRepository=MockAuthRepository();
    ChangePasswordUseCase changePasswordUseCase=ChangePasswordUseCase(authRepository: authRepository);
    when(authRepository.changePassword(changePasswordRequest: changePasswordRequest)).thenAnswer((realInvocation) async=> mockedResult,);
    var actual=await changePasswordUseCase.invoke(changePasswordRequest: changePasswordRequest);
    expect(actual, isA<Success<bool>>());
  });

}