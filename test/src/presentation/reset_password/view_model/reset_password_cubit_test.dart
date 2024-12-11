import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/request/reset_password_request.dart';
import 'package:online_exam_app/src/domain/entities/success_auth_entity.dart';
import 'package:online_exam_app/src/domain/use_case/auth_use_case/reset_password_use_case.dart';
import 'package:online_exam_app/src/presentation/reset_password/view_model/reset_password_action.dart';
import 'package:online_exam_app/src/presentation/reset_password/view_model/reset_password_cubit.dart';
import 'package:test/test.dart';

import 'reset_password_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ResetPasswordUseCase>()])
void main() {

    late ResetPasswordUseCase resetPasswordUseCase;
    late ResetPasswordCubit resetPasswordCubit;
    setUp(() {
      resetPasswordUseCase=MockResetPasswordUseCase();
      resetPasswordCubit=ResetPasswordCubit(resetPasswordUseCase);
    },);
      blocTest<ResetPasswordCubit, ResetPasswordState>(
        "should return emit[ResetPasswordLoadingState , ResetPasswordSuccessState] when  call method doAction(ResetPasswordContinueButtonPressedAction) is Successfully]",
        build: () {
          var mockedResult = Success<SuccessAuthEntity>(
              date: SuccessAuthEntity());
          provideDummy<ApiResult<SuccessAuthEntity>>(mockedResult);
          when(resetPasswordUseCase.invoke(
              resetPasswordRequest: ResetPasswordRequest(
                  email: "email", newPassword: ""))).thenAnswer((
              realInvocation) async => mockedResult,);
          return resetPasswordCubit;
        },
        act: (bloc) async {
          return resetPasswordCubit.doAction(
              ResetPasswordContinueButtonPressedAction());
        },
        expect: () =>
        <TypeMatcher<ResetPasswordState>>[
          isA<ResetPasswordLoadingStata>(),
          isA<ResetPasswordSuccessStata>(),
        ],
      );
    blocTest<ResetPasswordCubit, ResetPasswordState>(
      "should return emit[ResetPasswordLoadingState , ResetPasswordFailuresState] when  call method doAction(ResetPasswordContinueButtonPressedAction) is failures]",
      build: () {
        var mockedResult = Failures<SuccessAuthEntity>(exception: Exception());
        provideDummy<ApiResult<SuccessAuthEntity>>(mockedResult);
        when(resetPasswordUseCase.invoke(
            resetPasswordRequest: ResetPasswordRequest(
                email: "email", newPassword: ""))).thenAnswer((
            realInvocation) async => mockedResult,);
        return resetPasswordCubit;
      },
      act: (bloc) async {
        return resetPasswordCubit.doAction(
            ResetPasswordContinueButtonPressedAction());
      },
      expect: () =>
      <TypeMatcher<ResetPasswordState>>[
        isA<ResetPasswordLoadingStata>(),
        isA<ResetPasswordErrorStata>(),
      ],
    );
    blocTest<ResetPasswordCubit, ResetPasswordState>(
      "should return emit[ Navigate To BaseScreen] when  call method doAction(NavigateBaseScreen) is Successfully]",
      build: () => resetPasswordCubit,
      act: (bloc) async {
        return resetPasswordCubit.doAction(NavigateToBaseMainScreenAction());
      },
      expect: () =>
      <TypeMatcher<ResetPasswordState>>[
        isA<NavigateToBaseScreenState>(),
      ],
    );


    //   blocTest<ForgetPasswordCubit,ForgetPasswordState>(
    //     "should return emit[ForgetPasswordLoadingState , ForgetPasswordFailuresStata] when  call method doAction(OnClickForgetPasswordAction) is failures]",
    //     build: () {
    //       var mockedResult=Failures<SuccessAuthEntity>(exception: Exception());
    //       provideDummy<ApiResult<SuccessAuthEntity>>(mockedResult);
    //       when(forgetPasswordUseCase.invoke(forgetPasswordRequest: ForgetPasswordRequest(email: "email"))).thenAnswer((realInvocation)async => mockedResult,);
    //       return forgetPasswordCubit;
    //     },
    //     act: (bloc)async {
    //       return forgetPasswordCubit.doAction(OnClickForgetPasswordAction());
    //     },
    //     expect: () => <TypeMatcher<ForgetPasswordState>>[
    //       isA<ForgetPasswordLoadingState>(),
    //       isA<ForgetPasswordErrorState>(),
    //     ],
    //   );
    //
    //   blocTest<ForgetPasswordCubit,ForgetPasswordState>(
    //     "should return emit[NavigateToVerifyResetCodeState] when  call method doAction(NavigateToVerifyResetCode) is failures]",
    //     build: () => forgetPasswordCubit,
    //     act: (bloc)async {
    //       return forgetPasswordCubit.doAction(NavigateVerifyResetCodeScreenAction());
    //     },
    //     expect: () => <TypeMatcher<ForgetPasswordState>>[
    //       isA<NavigateToVerifyResetCodeState>(),
    //     ],
    //   );
    //
    // },);
  }
