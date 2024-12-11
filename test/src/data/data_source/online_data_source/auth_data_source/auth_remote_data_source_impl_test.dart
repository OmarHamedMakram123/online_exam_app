import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/src/data/api/api_manger.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/auth_data_source/auth_online_data_source.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/auth_data_source/auth_online_data_source_impl.dart';
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

import '../../../data_api/api_manger.mocks.dart';

void main() {
  group(
    "Auth Online Data Source Test",
    () {
      ApiManger apiManger = MockApiManger();
      AuthOnlineDataSource authDataSource = AuthOnlineDataSourceImpl(apiManger);
      AppUserModel appUserModel = AppUserModel();
      test(
        "should return appUserModel when call apiManger.login  ",
        () async {
          LoginRequest loginRequest =
              LoginRequest(email: "emailFake", password: "passwordFake");
          when(apiManger.login(loginRequest)).thenAnswer(
            (realInvocation) async => appUserModel,
          );
          var actual = await authDataSource.login(loginRequest);
          expect(actual, appUserModel);
        },
      );
      test(
        "should return appUserModel when call apiManger.login  ",
        () async {
          RegisterRequest registerRequest = RegisterRequest(
              username: "username",
              firstName: "firstName",
              lastName: "lastName",
              email: "email",
              password: "password",
              rePassword: "rePassword",
              phone: "phone");
          when(apiManger.register(registerRequest)).thenAnswer(
            (realInvocation) async => appUserModel,
          );
          var actual = await authDataSource.register(registerRequest);
          expect(actual, appUserModel);
        },
      );
      test(
        "should return appUserModel when call apiMange.getProfileDate ",
        () async {
          AppUserModel appUserModel = AppUserModel();
          when(apiManger.getLoggedUserInfo()).thenAnswer(
            (realInvocation) async => appUserModel,
          );
          var actual = await authDataSource.getProfileDate();
          expect(actual, appUserModel);
        },
      );
      test(
        "should return appUserModel when call apiMange.updateProfile ",
            () async {
          UpdateProfileRequest updateProfileRequest=UpdateProfileRequest(username: "username", firstName: "firstName", lastName: "lastName", email: "email", phone: "phone");
          AppUserModel appUserModel = AppUserModel();
          when(apiManger.updateProfileData(updateProfileRequest: updateProfileRequest)).thenAnswer(
                (realInvocation) async => appUserModel,
          );
          var actual = await authDataSource.updateProfile(updateProfileRequest: updateProfileRequest);
          expect(actual, appUserModel);
        },
      );
      test(
        "should return successResponseModel when call apiMange.changePassword ",
            () async {
          ChangePasswordRequest changePasswordRequest=ChangePasswordRequest();
          SuccessAuthResponseModel successResponseModel = SuccessAuthResponseModel();
          when(apiManger.changePassword(changePasswordRequest: changePasswordRequest)).thenAnswer(
                (realInvocation) async =>successResponseModel ,
          );
          var actual = await authDataSource.changePassword(changePasswordRequest: changePasswordRequest);
          expect(actual, successResponseModel);
        },
      );
      test("should return forgetPasswordResponse when call apiMange.forgetPassword", () async{
        ForgetPasswordRequest forgetPasswordRequest=ForgetPasswordRequest(email: "");
        ForgetPasswordResponseModel forgetPasswordResponseModel=ForgetPasswordResponseModel(message: "", info: "");
        when(apiManger.forgetPassword(forgetPasswordRequest: forgetPasswordRequest)).thenAnswer((realInvocation)async => forgetPasswordResponseModel ,);
        var actual=await authDataSource.forgetPassword(forgetPasswordRequest: forgetPasswordRequest);
        expect(actual, forgetPasswordResponseModel);
        },);
      test("should return successResponseModel when call apiMange.resetPassword", () async{
        ResetPasswordRequest resetPasswordRequest=ResetPasswordRequest(email: "",newPassword: "");
        SuccessAuthResponseModel successResponseModel=SuccessAuthResponseModel(message: "", token: "");
        when(apiManger.resetPassword(resetPasswordRequest: resetPasswordRequest)).thenAnswer((realInvocation)async => successResponseModel,);
        var actual=await authDataSource.resetPassword(resetPasswordRequest: resetPasswordRequest);
        expect(actual, successResponseModel);
      },);
      test("should return forgetPasswordResponse when call apiMange.verifyRestCode", () async{
        VerifyResetCodeRequest verifyRestCode=VerifyResetCodeRequest(resetCode: "");
        SuccessAuthResponseModel successAuthResponseModel=SuccessAuthResponseModel(message: "");
        when(apiManger.verifyResetCode(verifyRestCode: verifyRestCode)).thenAnswer((realInvocation)async => successAuthResponseModel ,);
        var actual=await authDataSource.verifyResetCode(verifyRestCode: verifyRestCode);
        expect(actual, successAuthResponseModel);
      },);
      test("should return  massage   when  call apiManger.logOut",() async{
        String massage="";
         when(apiManger.logoOut()).thenAnswer((realInvocation) async => massage,);
        var actual=await authDataSource.logOut();
        expect(actual, massage);
         },);
    },
  );
}
