import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/domain/repositories/auth_repository.dart';
import 'package:online_exam_app/src/domain/use_case/auth_use_case/logout_use_case.dart';
import 'package:test/test.dart';

import '../mocked/moked_repository.mocks.dart';


void main() {
  test('should return success<true> when call authRepository.logOut is successfully', () async{
  AuthRepository authRepository=MockAuthRepository();
  LogoutUseCase logoutUseCase=LogoutUseCase(authRepository: authRepository);
  var mockedResult=Success<bool>(date: true);
  provideDummy<ApiResult<bool>>(mockedResult);
  when(authRepository.logOut()).thenAnswer((realInvocation) async=> mockedResult,);
  var actual=await logoutUseCase.invoke();
  expect(actual, mockedResult);
  });
}