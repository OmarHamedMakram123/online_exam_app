import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/request/forget_password_request.dart';
import 'package:online_exam_app/src/domain/entities/success_auth_entity.dart';
import 'package:online_exam_app/src/domain/use_case/auth_use_case/forget_password_use_case.dart';
import 'package:online_exam_app/src/presentation/forget_password/view_model/forget_password_action.dart';
import 'package:online_exam_app/src/presentation/forget_password/view_model/forget_password_cubit.dart';
import 'package:online_exam_app/src/presentation/login/view_model/login_cubit.dart';
import 'package:test/test.dart';

import 'forget_password_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ForgetPasswordUseCase>()])
void main() {
  late ForgetPasswordUseCase forgetPasswordUseCase;
  late ForgetPasswordCubit forgetPasswordCubit;
  setUp(() {
    forgetPasswordUseCase=MockForgetPasswordUseCase();
    forgetPasswordCubit=ForgetPasswordCubit(forgetPasswordUseCase);
  },);
  group("Test Forget Password Cubit  method do Action ", () {
    blocTest<ForgetPasswordCubit,ForgetPasswordState>(
        "should return emit[ForgetPasswordLoadingState , ForgetPasswordSuccessState] when  call method doAction(OnClickForgetPasswordAction) is Successfully]",
     build: () {
       var mockedResult=Success<SuccessAuthEntity>(date: SuccessAuthEntity());
       provideDummy<ApiResult<SuccessAuthEntity>>(mockedResult);
       when(forgetPasswordUseCase.invoke(forgetPasswordRequest: ForgetPasswordRequest(email: "email"))).thenAnswer((realInvocation)async => mockedResult,);
       return forgetPasswordCubit;
     },
     act: (bloc)async {
       return forgetPasswordCubit.doAction(OnClickForgetPasswordAction());
     },
      expect: () => <TypeMatcher<ForgetPasswordState>>[
        isA<ForgetPasswordLoadingState>(),
        isA<ForgetPasswordSuccessState>(),
      ],
    );
    blocTest<ForgetPasswordCubit,ForgetPasswordState>(
      "should return emit[ForgetPasswordLoadingState , ForgetPasswordFailuresStata] when  call method doAction(OnClickForgetPasswordAction) is failures]",
      build: () {
        var mockedResult=Failures<SuccessAuthEntity>(exception: Exception());
        provideDummy<ApiResult<SuccessAuthEntity>>(mockedResult);
        when(forgetPasswordUseCase.invoke(forgetPasswordRequest: ForgetPasswordRequest(email: "email"))).thenAnswer((realInvocation)async => mockedResult,);
        return forgetPasswordCubit;
      },
      act: (bloc)async {
        return forgetPasswordCubit.doAction(OnClickForgetPasswordAction());
      },
      expect: () => <TypeMatcher<ForgetPasswordState>>[
        isA<ForgetPasswordLoadingState>(),
        isA<ForgetPasswordErrorState>(),
      ],
    );

    blocTest<ForgetPasswordCubit,ForgetPasswordState>(
      "should return emit[NavigateToVerifyResetCodeState] when  call method doAction(NavigateToVerifyResetCode) is failures]",
      build: () => forgetPasswordCubit,
      act: (bloc)async {
        return forgetPasswordCubit.doAction(NavigateVerifyResetCodeScreenAction());
      },
      expect: () => <TypeMatcher<ForgetPasswordState>>[
        isA<NavigateToVerifyResetCodeState>(),
      ],
    );

  },);
}