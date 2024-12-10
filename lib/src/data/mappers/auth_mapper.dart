import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/data/model/response/app_user_model/app_user_model.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';

abstract class AuthMapper {
  AppUserEntity toAppUserModel(AppUserModel appUserModel);
}

@Injectable(as: AuthMapper)
class AuthMapperImpl implements AuthMapper {
  @override
  AppUserEntity toAppUserModel(AppUserModel appUserModel) {
    return AppUserEntity(
      username: appUserModel.user?.username,
      firstName: appUserModel.user?.firstName,
      lastName: appUserModel.user?.lastName,
      email: appUserModel.user?.email,
      phone: appUserModel.user?.phone,
    );
  }
}
