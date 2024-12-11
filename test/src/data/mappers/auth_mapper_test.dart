import 'package:flutter_test/flutter_test.dart';
import 'package:online_exam_app/src/data/mappers/auth_mapper.dart';
import 'package:online_exam_app/src/data/model/response/app_user_model/app_user_model.dart';
import 'package:online_exam_app/src/data/model/response/forget_password_response/forget_password_response_model.dart';
import 'package:online_exam_app/src/data/model/response/success_auth_reponse_model/success_auth_response_model.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import 'package:online_exam_app/src/domain/entities/success_auth_entity.dart';

void main() {
  group(
    "Auth Mapper Test",
    () {
      AuthMapper authMapper = AuthMapperImpl();
      test(
        "should return appUserEntity whn call AuthMapper.toUserEntity  ",
        () {
          String fakeUserName = "fakeUserName";
          String fakeFirstName = "fakeFirstName";
          String fakeLastName = "fakeLastName";
          String fakeEmail = "fakeEmail";
          String fakePhone = "fakePhone";
          String fakeMessage = "fakeMessage";
          String fakeToken = "fakeMessage";
          AppUserModel appUserModel = AppUserModel(
            token: fakeToken,
            message: fakeMessage,
            user: User(
              email: fakeEmail,
              lastName: fakeLastName,
              username: fakeUserName,
              firstName: fakeFirstName,
              phone: fakePhone,
            ),
          );

          AppUserEntity appUserEntity = AppUserEntity(
            username: fakeUserName,
            firstName: fakeFirstName,
            lastName: fakeLastName,
            email: fakeEmail,
            phone: fakePhone,
          );

          var actual = authMapper.toAppUserModel(appUserModel);
          expect(actual.username, appUserEntity.username);
          expect(actual.lastName, appUserEntity.lastName);
        },
      );
      test(
        "should return successAuthEntity when call AuthMapper.toAuthSuccessResponseModel",
        () {
          String fakeMassage = "fakeMassage";
          SuccessAuthResponseModel successAuthResponseModel =
              SuccessAuthResponseModel(
                  token: "fakeToken", message: fakeMassage);
          SuccessAuthEntity successAuthEntity =
              SuccessAuthEntity(massage: fakeMassage);
          var actual =
              authMapper.toSuccessAuthResponseModel(successAuthResponseModel);
          expect(actual.massage, fakeMassage);
        },
      );

      test(
        "should return successAuthEntity when call AuthMapper.toForgetPasswordResponse",
        () {
          String fakeInfo = "fakeInfo";
          ForgetPasswordResponseModel forgetPasswordResponseModel =
              ForgetPasswordResponseModel(info: "fakeInfo", message: fakeInfo);
          SuccessAuthEntity successAuthEntity =
              SuccessAuthEntity(massage: fakeInfo);
          var actual = authMapper
              .toForgetPasswordResponseModel(forgetPasswordResponseModel);
          expect(actual.massage, fakeInfo);
        },
      );
    },
  );
}
