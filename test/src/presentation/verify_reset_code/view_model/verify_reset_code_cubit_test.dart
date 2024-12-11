import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/request/verify_reset_code_request.dart';
import 'package:online_exam_app/src/domain/entities/success_auth_entity.dart';
import 'package:online_exam_app/src/domain/use_case/auth_use_case/verify_reset_code_use_case.dart';
import 'package:online_exam_app/src/presentation/verify_reset_code/view_model/verify_reset_code_action.dart';
import 'package:online_exam_app/src/presentation/verify_reset_code/view_model/verify_reset_code_cubit.dart';
import 'package:test/test.dart';

import 'verify_reset_code_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<VerifyResetCodeUseCase>()])
void main() {
  late VerifyResetCodeUseCase verifyResetCodeUseCase;
  late VerifyResetCodeCubit verifyResetCodeCubit;
  setUp(
    () {
      verifyResetCodeUseCase=MockVerifyResetCodeUseCase();
      verifyResetCodeCubit=VerifyResetCodeCubit(verifyResetCodeUseCase);
    },
  );
  blocTest<VerifyResetCodeCubit, VerifyResetCodeState>(
    'should return {}  when call doAction(VerifyResetCompletedAction) setResetCode with invalid reset code',
    build: () => verifyResetCodeCubit,
    act: (cubit) => cubit.doAction(VerifyResetCompletedAction(value: "")),
    expect: () => [],
  );

  blocTest<VerifyResetCodeCubit, VerifyResetCodeState>(
    'should return emits[VerifyResetCodeLoadingState , VerifyResetCodeSuccessState]  when call doAction(VerifyResetCompletedAction) is successfully',
    build: (){
      SuccessAuthEntity successAuthEntity=SuccessAuthEntity();
      var mockedResult=Success<SuccessAuthEntity>(date: successAuthEntity);
      provideDummy<ApiResult<SuccessAuthEntity>>(mockedResult);
      when(verifyResetCodeUseCase.invoke(verifyResetCodeRequest: VerifyResetCodeRequest(resetCode: "resetCode"))).thenAnswer((realInvocation)async => mockedResult,);
       return verifyResetCodeCubit;
      },
    act: (cubit) => cubit.doAction(VerifyResetCompletedAction(value: "1234567")),
    expect: () => <TypeMatcher<VerifyResetCodeState>>[
      isA<VerifyCodeLoadingStata>(),
      isA<VerifyCodeSuccessStata>(),
    ],
  );

}