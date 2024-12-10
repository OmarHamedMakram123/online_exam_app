import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/request/change_password_request.dart';
import 'package:online_exam_app/src/domain/use_case/change_password_use_case.dart';
import 'package:online_exam_app/src/presentation/change_password/view_model/change_password_action.dart';
import 'package:online_exam_app/src/presentation/change_password/view_model/change_password_cubit.dart';
import 'package:test/test.dart';

import 'change_password_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ChangePasswordUseCase>()])
void main() {
  late ChangePasswordUseCase changePasswordUseCase;
  late ChangePasswordCubit changePasswordCubit;
  setUp(
    () {
      changePasswordUseCase = MockChangePasswordUseCase();
      changePasswordCubit = ChangePasswordCubit(changePasswordUseCase);
    },
  );
  group(
    "Test ChangePassword Cubit do Action ",
    () {
      blocTest<ChangePasswordCubit, ChangePasswordState>(
        'should return emit[ChangePasswordLoadingState ,ChangePasswordSuccessState] when call doAction(GetAllChangePasswordAction()) is Successfully',
        build: () {
          var mockedResult = Success<bool>(date: true);
          provideDummy<ApiResult<bool>>(mockedResult);
          when(changePasswordUseCase.invoke(
                  changePasswordRequest: ChangePasswordRequest()))
              .thenAnswer(
            (realInvocation) async => mockedResult,
          );
          return changePasswordCubit;
        },
        act: (bloc) async {
          return await changePasswordCubit
              .doAction(GetCallChangePasswordAction());
        },
        expect: () => <TypeMatcher<ChangePasswordState>>[
          isA<ChangePasswordLoadingState>(),
          isA<ChangePasswordFailuresState>(),
        ],
      );
      blocTest<ChangePasswordCubit, ChangePasswordState>(
        'should return emit[ChangePasswordLoadingState ,ChangePasswordFailuresState] when call doAction(GetAllChangePasswordAction()) is Failures',
        build: () {
          var mockedResult = Failures<bool>(exception: Exception(""));
          provideDummy<ApiResult<bool>>(mockedResult);
          when(changePasswordUseCase.invoke(
                  changePasswordRequest: ChangePasswordRequest()))
              .thenAnswer(
            (realInvocation) async => mockedResult,
          );
          return changePasswordCubit;
        },
        act: (bloc) async {
          return await changePasswordCubit
              .doAction(GetCallChangePasswordAction());
        },
        expect: () => <TypeMatcher<ChangePasswordState>>[
          isA<ChangePasswordLoadingState>(),
          isA<ChangePasswordFailuresState>(),
        ],
      );
    },
  );
}
