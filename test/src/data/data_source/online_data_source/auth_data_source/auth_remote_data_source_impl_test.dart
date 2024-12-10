import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/src/data/api/api_manger.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/auth_data_source/auth_online_data_source.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/auth_data_source/auth_online_data_source_impl.dart';
import 'package:online_exam_app/src/data/model/request/change_password_request.dart';
import 'package:online_exam_app/src/data/model/request/login_request.dart';
import 'package:online_exam_app/src/data/model/request/register_request.dart';
import 'package:online_exam_app/src/data/model/request/update_profile_request.dart';
import 'package:online_exam_app/src/data/model/response/app_user_model/app_user_model.dart';
import 'package:online_exam_app/src/data/model/response/success_auth_reponse_model/success_response_model.dart';

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
        "should return successAppUserModel when call apiMange.changePassword ",
            () async {
          ChangePasswordRequest changePasswordRequest=ChangePasswordRequest();
          SuccessResponseModel successResponseModel = SuccessResponseModel();
          when(apiManger.changePassword(changePasswordRequest: changePasswordRequest)).thenAnswer(
                (realInvocation) async =>successResponseModel ,
          );
          var actual = await authDataSource.changePassword(changePasswordRequest: changePasswordRequest);
          expect(actual, successResponseModel);
        },
      );
    },
  );
}
