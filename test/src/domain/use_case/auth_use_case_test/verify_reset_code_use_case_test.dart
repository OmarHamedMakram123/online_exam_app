import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/request/verify_reset_code_request.dart';
import 'package:online_exam_app/src/domain/entities/success_auth_entity.dart';
import 'package:online_exam_app/src/domain/repositories/auth_repository.dart';
import 'package:online_exam_app/src/domain/use_case/auth_use_case/verify_reset_code_use_case.dart';
import 'package:test/test.dart';

import '../mocked/moked_repository.mocks.dart';

void main() {
  test('should return success<SuccessAuthEntity> when  call authRepository.resetPassword', ()async {
    VerifyResetCodeRequest verifyResetCodeRequest=VerifyResetCodeRequest(resetCode: "12313");
    SuccessAuthEntity successAuthEntity=SuccessAuthEntity();
    AuthRepository authRepository=MockAuthRepository();
    VerifyResetCodeUseCase  verifyResetCodeUseCase=VerifyResetCodeUseCase(authRepository: authRepository);
    var mockedResult=Success<SuccessAuthEntity>(date: successAuthEntity);
    provideDummy<ApiResult<SuccessAuthEntity>>(mockedResult);
    when(authRepository.verifyResetCode(verifyRestCode: verifyResetCodeRequest)).thenAnswer((realInvocation) async=> mockedResult,);
    var actual=await verifyResetCodeUseCase.invoke(verifyResetCodeRequest: verifyResetCodeRequest);
    expect(actual, mockedResult);
  });
}