import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/auth_offline_data_source/auth_offline_data_source.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/auth_data_source/auth_online_data_source.dart';
import 'package:online_exam_app/src/data/mappers/auth_mapper.dart';
import 'package:online_exam_app/src/data/model/request/change_password_request.dart';
import 'package:online_exam_app/src/data/model/request/forget_password_request.dart';
import 'package:online_exam_app/src/data/model/request/login_request.dart';
import 'package:online_exam_app/src/data/model/request/register_request.dart';
import 'package:online_exam_app/src/data/model/request/reset_password_request.dart';
import 'package:online_exam_app/src/data/model/request/update_profile_request.dart';
import 'package:online_exam_app/src/data/model/request/verify_reset_code_request.dart';
import 'package:online_exam_app/src/data/model/response/app_user_model/app_user_model.dart';
import 'package:online_exam_app/src/data/model/response/forget_password_response/forget_password_response_model.dart';
import 'package:online_exam_app/src/data/model/response/success_auth_reponse_model/success_auth_response_model.dart';
import 'package:online_exam_app/src/data/repositories/auth_repository_impl.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import 'package:online_exam_app/src/domain/entities/success_auth_entity.dart';
import 'package:online_exam_app/src/domain/repositories/auth_repository.dart';

import 'auth_repositorty_impl_test.mocks.dart';

@GenerateMocks([AuthOnlineDataSource, AuthMapper, AuthOfflineDataSource])
void main() {
  group(
    "Auth Repository Impl ",
    () {
      AuthOnlineDataSource mockedAuthOnlineDataSource =
          MockAuthOnlineDataSource();

      AuthMapper mockedAuthMapper = MockAuthMapper();
      AppUserModel appUserModel = AppUserModel(
          user: User(
              username: "username",
              firstName: "firstName",
              lastName: "lastName",
              email: "email",
              phone: "phone"));
      AppUserEntity appUserEntity = AppUserEntity(
          username: "username",
          firstName: "firstName",
          lastName: "lastName",
          email: "email",
          phone: "phone");
      AuthOfflineDataSource authOfflineDataSource = MockAuthOfflineDataSource();
      AuthRepository authRepository = AuthRepositoryImpl(
          authOfflineDataSource, mockedAuthOnlineDataSource, mockedAuthMapper);

      group(
        "Test Method  Login Auth Repository",
        () {
          LoginRequest loginRequest =
              LoginRequest(email: "fakeEmail", password: "fakePassword");
          test(
            "should return appUserModel when call AuthOnlineRemoteDataSource.login  and map the app userEntity  is success",
            () async {
              when(mockedAuthOnlineDataSource.login(loginRequest)).thenAnswer(
                (realInvocation) async => appUserModel,
              );
              when(authOfflineDataSource.saveToken(token: "token")).thenAnswer((realInvocation) async=>{} ,);

              when(mockedAuthMapper.toAppUserModel(appUserModel))
                  .thenReturn(appUserEntity);

              var actual =
                  await authRepository.login(loginRequest: loginRequest);
              expect(actual, isA<Success<AppUserEntity>>());
            },
          );
          test(
            "should return  exceptions when call AuthOnlineRemoteDataSource.login is Failures",
            () async {
              when(mockedAuthOnlineDataSource.login(loginRequest)).thenThrow(
                  DioException(
                      requestOptions: RequestOptions(),
                      type: DioExceptionType.connectionError));
             when(authOfflineDataSource.saveToken(token: "token")).thenAnswer((realInvocation) async=>{} ,);
              var actual =
                  await authRepository.login(loginRequest: loginRequest);
              expect(actual, isA<Failures<AppUserEntity>>());
            },
          );
        },
      );

      group(
        "Test Method  Register Auth Repository",
        () {
          RegisterRequest registerRequest = RegisterRequest(
              username: "username",
              firstName: "firstName",
              lastName: "lastName",
              email: "email",
              password: "password",
              rePassword: "rePassword",
              phone: "phone");
          test(
            "should return appUserModel when call AuthOnlineDataSource.register  and   map appUserEntity is Success ",
            () async {
              when(mockedAuthOnlineDataSource.register(registerRequest))
                  .thenAnswer(
                (realInvocation) async => appUserModel,
              );
              when(mockedAuthMapper.toAppUserModel(appUserModel))
                  .thenReturn(appUserEntity);
              var actual = await authRepository.register(
                  registerRequest: registerRequest);
              expect(actual, isA<Success<AppUserEntity>>());
            },
          );
          test(
            "should return  exceptions when call AuthOnlineRemoteDataSource.register is Failures",
            () async {
              when(mockedAuthOnlineDataSource.register(registerRequest))
                  .thenThrow(DioException(
                      requestOptions: RequestOptions(),
                      type: DioExceptionType.connectionError));
              var actual = await authRepository.register(
                  registerRequest: registerRequest);
              expect(actual, isA<Failures<AppUserEntity>>());
            },
          );
        },
      );
      group(
        "Test  Method getProfileData Auth Repository",
        () {
          test(
            "should return appUserEntity when call authOnlineDataSource.getProfileData and map appUserModel is Successfully",
            () async {
              when(mockedAuthOnlineDataSource.getProfileDate()).thenAnswer(
                (realInvocation) async => appUserModel,
              );
              when(mockedAuthMapper.toAppUserModel(appUserModel))
                  .thenReturn(appUserEntity);
              var actual = await authRepository.getProfileData();
              expect(actual, isA<Success<AppUserEntity>>());
            },
          );
          test(
              "should return exceptions when call authOnlineDataSource.getProfile Data and mao is failures  ",
              () async {
            when(mockedAuthOnlineDataSource.getProfileDate())
                .thenThrow(Exception());
            when(mockedAuthMapper.toAppUserModel(appUserModel))
                .thenReturn(appUserEntity);
            var actual = await authRepository.getProfileData();
            expect(actual, isA<Failures<AppUserEntity>>());
          });
        },
      );

      group(
        "Test  Method updateProfile Auth Repository",
        () {
          UpdateProfileRequest updateProfileRequest = UpdateProfileRequest(
              username: "username",
              firstName: "firstName",
              lastName: "lastName",
              email: "email",
              phone: "phone");
          test(
            "should return appUserEntity when call authOnlineDataSource.updateProfile and map appUserModel is Successfully",
            () async {
              when(mockedAuthOnlineDataSource.updateProfile(
                      updateProfileRequest: updateProfileRequest))
                  .thenAnswer(
                (realInvocation) async => appUserModel,
              );
              when(mockedAuthMapper.toAppUserModel(appUserModel))
                  .thenReturn(appUserEntity);
              var actual = await authRepository.updateProfile(
                  updateProfileRequest: updateProfileRequest);
              expect(actual, isA<Success<AppUserEntity>>());
            },
          );
          test(
              "should return exceptions when call authOnlineDataSource.updateProfile Data and mao is failures  ",
              () async {
            when(mockedAuthOnlineDataSource.updateProfile(
                    updateProfileRequest: updateProfileRequest))
                .thenThrow(Exception());
            when(mockedAuthMapper.toAppUserModel(appUserModel))
                .thenReturn(appUserEntity);
            var actual = await authRepository.getProfileData();
            expect(actual, isA<Failures<AppUserEntity>>());
          });
        },
      );

      group(
        "Test  Method changePassword Auth Repository",
        () {
          ChangePasswordRequest changePasswordRequest = ChangePasswordRequest();

          test(
            "should return appUserEntity when call authOnlineDataSource.changePassword and map appUserModel is Successfully",
            () async {
              SuccessAuthResponseModel successResponseModel =
                  SuccessAuthResponseModel();
              when(mockedAuthOnlineDataSource.changePassword(
                      changePasswordRequest: changePasswordRequest))
                  .thenAnswer(
                (realInvocation) async => successResponseModel,
              );
              var actual = await authRepository.changePassword(
                  changePasswordRequest: changePasswordRequest);
              expect(actual, isA<Success<bool>>());
            },
          );
          test(
              "should return exceptions when call authOnlineDataSource.changePassword Data and mao is failures  ",
              () async {
            when(mockedAuthOnlineDataSource.changePassword(
                    changePasswordRequest: changePasswordRequest))
                .thenThrow(Exception());
            var actual = await authRepository.changePassword(
                changePasswordRequest: changePasswordRequest);
            expect(actual, isA<Failures<bool>>());
          });
        },
      );
      group("Test Method ForgetPassword  Auth Repository Impl ", () {
        test("should return success<SuccessResponseModel> when call authOnlineDataSource.forgetPassword and map forgetPasswordResponse is successfully", ()async{
          ForgetPasswordRequest forgetPasswordRequest=ForgetPasswordRequest(email: "email");
          ForgetPasswordResponseModel forgetPasswordResponseModel=ForgetPasswordResponseModel();
          SuccessAuthEntity successAuthEntity=SuccessAuthEntity();
          when(mockedAuthOnlineDataSource.forgetPassword(forgetPasswordRequest: forgetPasswordRequest)).thenAnswer((realInvocation) async=>forgetPasswordResponseModel,);
          when(mockedAuthMapper.toForgetPasswordResponseModel(forgetPasswordResponseModel)).thenReturn(successAuthEntity);
          var actual=await authRepository.forgetPassword(forgetPasswordRequest: forgetPasswordRequest);
          expect(actual, isA<Success<SuccessAuthEntity>>());
        });
        test("should return Failures<Exceptions> when call authOnlineDataSource.forgetPassword and map forgetPasswordResponse is Failures", ()async{
          ForgetPasswordRequest forgetPasswordRequest=ForgetPasswordRequest(email: "email");
          ForgetPasswordResponseModel forgetPasswordResponseModel=ForgetPasswordResponseModel();
          SuccessAuthEntity successAuthEntity=SuccessAuthEntity();
          when(mockedAuthOnlineDataSource.forgetPassword(forgetPasswordRequest: forgetPasswordRequest)).thenThrow(Exception(),);
          when(mockedAuthMapper.toForgetPasswordResponseModel(forgetPasswordResponseModel)).thenReturn(successAuthEntity);
          var actual=await authRepository.forgetPassword(forgetPasswordRequest: forgetPasswordRequest);
          expect(actual, isA<Failures<SuccessAuthEntity>>());
        });

      },);
      group("Test Method ResetPassword  Auth Repository Impl ", () {
        test("should return success<SuccessResponseModel> when call authOnlineDataSource.resetPassword and map SuccessAuthResponseModel is successfully", ()async{
          ResetPasswordRequest resetPasswordRequest=ResetPasswordRequest(email: "email",newPassword: "");
          SuccessAuthResponseModel successAuthResponseModel=SuccessAuthResponseModel();
          SuccessAuthEntity successAuthEntity=SuccessAuthEntity();
          when(mockedAuthOnlineDataSource.resetPassword(resetPasswordRequest: resetPasswordRequest)).thenAnswer((realInvocation) async=>successAuthResponseModel,);
          when(mockedAuthMapper.toSuccessAuthResponseModel(successAuthResponseModel)).thenReturn(successAuthEntity);
          var actual=await authRepository.resetPassword(resetPasswordRequest: resetPasswordRequest);
          expect(actual, isA<Success<SuccessAuthEntity>>());
        });
        test("should return Failures<Exceptions> when call authOnlineDataSource.resetPassword and map resetPasswordResponse is Failures", ()async{
          SuccessAuthResponseModel successAuthResponseModel=SuccessAuthResponseModel();
          ResetPasswordRequest resetPasswordRequest=ResetPasswordRequest(email: "email", newPassword: "newPassword");
          SuccessAuthEntity successAuthEntity=SuccessAuthEntity();
          when(mockedAuthOnlineDataSource.resetPassword(resetPasswordRequest: resetPasswordRequest)).thenThrow(Exception(),);
          when(mockedAuthMapper.toSuccessAuthResponseModel(successAuthResponseModel)).thenReturn(successAuthEntity);
          var actual=await authRepository.resetPassword(resetPasswordRequest: resetPasswordRequest);
          expect(actual, isA<Failures<SuccessAuthEntity>>());
        });

      },);
      group("Test Method VerifyResetCode  Auth Repository Impl ", () {
        test("should return success<SuccessResponseModel> when call authOnlineDataSource.verifyResetCodeRequest and map SuccessAuthResponseModel is successfully", ()async{
          VerifyResetCodeRequest verifyResetCodeRequest=VerifyResetCodeRequest(resetCode:"");
          SuccessAuthResponseModel successAuthResponseModel=SuccessAuthResponseModel();
          SuccessAuthEntity successAuthEntity=SuccessAuthEntity();
          when(mockedAuthOnlineDataSource.verifyResetCode(verifyRestCode: verifyResetCodeRequest)).thenAnswer((realInvocation) async=>successAuthResponseModel,);
          when(mockedAuthMapper.toSuccessAuthResponseModel(successAuthResponseModel)).thenReturn(successAuthEntity);
          var actual=await authRepository.verifyResetCode(verifyRestCode: verifyResetCodeRequest);
          expect(actual, isA<Success<SuccessAuthEntity>>());
        });
        test("should return Failures<Exceptions> when call authOnlineDataSource.resetPassword and map resetPasswordResponse is Failures", ()async{
          VerifyResetCodeRequest verifyResetCodeRequest=VerifyResetCodeRequest(resetCode:"");
          SuccessAuthResponseModel successAuthResponseModel=SuccessAuthResponseModel();
          SuccessAuthEntity successAuthEntity=SuccessAuthEntity();
          when(mockedAuthOnlineDataSource.verifyResetCode(verifyRestCode: verifyResetCodeRequest)).thenThrow(Exception(),);
          when(mockedAuthMapper.toSuccessAuthResponseModel(successAuthResponseModel)).thenReturn(successAuthEntity);
          var actual=await authRepository.verifyResetCode(verifyRestCode: verifyResetCodeRequest);
          expect(actual, isA<Failures<SuccessAuthEntity>>());
        });
      },);
      group("Test Method Logout  Auth Repository Impl ", () {
        test("should return success<bool> when call authOnlineDataSource.logOut  is successfully", ()async{
          SuccessAuthResponseModel successAuthResponseModel=SuccessAuthResponseModel();
          when(mockedAuthOnlineDataSource.logOut()).thenAnswer((realInvocation)async =>"" ,);
          when(authOfflineDataSource.deleteToken()).thenAnswer((realInvocation)async => {},);
          var actual=await authRepository.logOut();
          expect(actual, isA<Success<bool>>());
        });
        test("should return Failures<Exceptions> when call authOnlineDataSource.logout  is Failures", ()async{
          when(mockedAuthOnlineDataSource.logOut()).thenThrow(Exception(),);
          var actual=await authRepository.logOut();
          expect(actual, isA<Failures<bool>>());
        });
      },);
    },

  );



}
