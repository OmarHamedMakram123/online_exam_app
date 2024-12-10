import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/request/login_request.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import 'package:online_exam_app/src/domain/use_case/login_use_case.dart';
import 'package:online_exam_app/src/presentation/login/view_model/login_action.dart';
import 'package:online_exam_app/src/presentation/login/view_model/login_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'login_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LoginUseCase>()])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late LoginUseCase loginUseCase;
  late LoginCubit loginCubit;
  setUp(() {
    loginUseCase = MockLoginUseCase();
    loginCubit = LoginCubit(loginUseCase);
  });

  tearDown(() {
    loginCubit.close();
  });
  blocTest<LoginCubit, LoginState>(
    'should return emit NavigateToRegisterScreenState  when call doAction is NavigateToRegisterAction',
    build: () => loginCubit,
    act: (bloc) async {
      return await loginCubit.doAction(NavigateToRegisterScreenAction());
    },
    expect: () =>
        <TypeMatcher<LoginState>>[isA<NavigateToRegisterScreenState>()],
  );

  blocTest<LoginCubit, LoginState>(
    'should return emit NavigateToForgetPasswordScreenState  when call doAction is NavigateToForgetPasswordAction',
    build: () => loginCubit,
    act: (bloc) async {
      return await loginCubit.doAction(NavigateToForgetPasswordScreenAction());
    },
    expect: () =>
        <TypeMatcher<LoginState>>[isA<NavigateToForgetPasswordScreenState>()],
  );

  blocTest<LoginCubit, LoginState>(
    'should return emit [NavigateToBaseScreenState]  when call doAction is NavigateToBaseAction',
    build: () => loginCubit,
    act: (bloc) async {
      return await loginCubit.doAction(NavigateToBaseScreenAction());
    },
    expect: () => <TypeMatcher<LoginState>>[isA<NavigateToBaseScreenState>()],
  );

  group(
    "should return emit state  when call doAction(LoginActionView)",
    () {
      AppUserEntity appUserEntity = AppUserEntity(
          username: "username",
          firstName: "firstName",
          lastName: "lastName",
          email: "email",
          phone: "phone");
      LoginRequest loginRequest =
          LoginRequest(email: "email", password: "password");
      blocTest<LoginCubit, LoginState>(
        "return  emit (LoginLoadingState,LoginSuccessState) if Successfully ",
        build: () {
          var mockedResult = Success<AppUserEntity>(date: appUserEntity);
          provideDummy<ApiResult<AppUserEntity>>(mockedResult);
          when(loginUseCase.invoke(loginRequest: loginRequest)).thenAnswer(
            (realInvocation) async => mockedResult,
          );
          return loginCubit;
        },
        act: (bloc) async => await loginCubit.doAction(ButtonLoginAction()),
        expect: () => <TypeMatcher<LoginState>>[
          isA<LoginLoadingState>(),
          isA<LoginSuccessState>()
        ],
      );

      blocTest<LoginCubit, LoginState>(
          "return  emit (LoginLoadingState,LoginErrorState) if Failures ",
          build: () {
            var mockedResult = Failures<AppUserEntity>(exception: Exception());
            provideDummy<ApiResult<AppUserEntity>>(mockedResult);
            when(loginUseCase.invoke(loginRequest: loginRequest)).thenAnswer(
              (realInvocation) async => mockedResult,
            );
            return loginCubit;
          },
          act: (bloc) async => await loginCubit.doAction(ButtonLoginAction()),
          expect: () =><TypeMatcher<LoginState>>[
              isA<LoginLoadingState>(),
             isA<LoginFailuresState>()
            ]
          );
    },
  );
}
