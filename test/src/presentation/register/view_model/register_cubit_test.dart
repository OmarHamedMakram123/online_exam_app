import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/request/register_request.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import 'package:online_exam_app/src/domain/use_case/auth_use_case/register_use_case.dart';
import 'package:online_exam_app/src/presentation/register/view_model/register_action.dart';
import 'package:online_exam_app/src/presentation/register/view_model/register_cubit.dart';
import 'package:test/test.dart';

import '../../reset_password/view_model/reset_password_cubit_test.mocks.dart';
import 'register_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RegisterUseCase>()])
void main() {
  late RegisterUseCase registerUseCase;
  late RegisterCubit registerCubit;
  setUp(() {
    registerUseCase=MockRegisterUseCase();
    registerCubit=RegisterCubit(registerUseCase);

  },);
  group("Test Register Cubit DoAction", () {
  RegisterRequest registerRequest =RegisterRequest(
      username: "username",
      firstName: "firstName",
      lastName: "lastName",
      email: "email",
      password: 'password',
      rePassword: "rePassword",
      phone: "phone")   ;
   AppUserEntity appUserEntity=AppUserEntity(username: "username", firstName: "firstName", lastName: "lastName", email: "email", phone: "phone");
  blocTest<RegisterCubit,RegisterState>(
      "should return emit[RegisterLoadingState ,RegisterErrorState] when call doAction(OnClickRegisterButton) is Successfully",
      build: () {
        var mockedResult=Success<AppUserEntity>(date: appUserEntity);
        provideDummy<ApiResult<AppUserEntity>>(mockedResult);
        when(registerUseCase.invoke(registerRequest: registerRequest)).thenAnswer((realInvocation)async => mockedResult,);
        return registerCubit;
      },
    act: (bloc) =>registerCubit.doAction(RegisterButtonClickAction()),
    expect: () => <TypeMatcher<RegisterState>>[
      isA<RegisterLoadingState>(),
      isA<RegisterSuccessState>()
    ],
  );

  blocTest<RegisterCubit,RegisterState>(
    "should return emit[RegisterLoadingState ,RegisterErrorState] when call doAction(OnClickRegisterButton) is Successfully",
    build: () {
      var mockedResult=Failures<AppUserEntity>(exception: Exception());
      provideDummy<ApiResult<AppUserEntity>>(mockedResult);
      when(registerUseCase.invoke(registerRequest: registerRequest)).thenAnswer((realInvocation)async => mockedResult,);
      return registerCubit;
    },
    act: (bloc) =>registerCubit.doAction(RegisterButtonClickAction()),
    expect: () => <TypeMatcher<RegisterState>>[
      isA<RegisterLoadingState>(),
      isA<RegisterErrorState>()
    ],
  );
  },);
}