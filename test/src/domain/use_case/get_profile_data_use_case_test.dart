import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import 'package:online_exam_app/src/domain/repositories/auth_repository.dart';
import 'package:online_exam_app/src/domain/use_case/get_profile_data_use_case.dart';
import 'package:test/test.dart';

import 'mocked/moked_repository.mocks.dart';

void main() {
 test("should call Success<AppUserEntity> when call authRepository.getProfileData is SuccessFully", () async{
   AuthRepository authRepository=MockAuthRepository();
   GetProfileDataUseCase getProfileDataUseCase=GetProfileDataUseCase(authRepository: authRepository);
   var mockedResult=Success<AppUserEntity>(date: AppUserEntity(username: '',firstName: "",email: '',phone: "",lastName: ""));
  provideDummy<ApiResult<AppUserEntity>>(mockedResult);
  when(authRepository.getProfileData()).thenAnswer((realInvocation) async=> mockedResult,);
   var actual=await getProfileDataUseCase.invoke();
   expect(actual, isA<Success<AppUserEntity>>());
 },);
}