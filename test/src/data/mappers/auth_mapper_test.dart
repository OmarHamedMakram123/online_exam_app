import 'package:flutter_test/flutter_test.dart';
import 'package:online_exam_app/src/data/mappers/auth_mapper.dart';
import 'package:online_exam_app/src/data/model/response/app_user_model/app_user_model.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';

void main() {
  group(
    "Auth Mapper Test",
    () {
      test(
        "should return appUserEntity whn call AuthMapper.toUserEntity  ",
        () {
          AuthMapper authMapper = AuthMapperImpl();
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
    },
  );
}
