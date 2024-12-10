import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/request/login_request.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import 'package:online_exam_app/src/domain/repositories/auth_repository.dart';
import 'package:online_exam_app/src/domain/use_case/login_use_case.dart';

import 'mocked/moked_repository.mocks.dart';

void main() {
  test('should return AppResult<AppUsrEntity> when call AuthRepository.login ',
      () async {
    AuthRepository authRepository = MockAuthRepository();
    LoginUseCase loginUseCase = LoginUseCase(authRepository: authRepository);
    LoginRequest loginRequest = LoginRequest(email: "email", password: "");
    var mockedResult = Success<AppUserEntity>(
        date: AppUserEntity(
            lastName: "", username: "", phone: "", email: "", firstName: ""));
    provideDummy<ApiResult<AppUserEntity>>(mockedResult);
    when(authRepository.login(loginRequest: loginRequest))
        .thenAnswer((_) async => mockedResult);
    var actual = await loginUseCase.invoke(loginRequest: loginRequest);
    expect(actual, isA<Success<AppUserEntity>>());
  });
}
