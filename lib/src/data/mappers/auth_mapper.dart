import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/data/model/response/app_user_model/app_user_model.dart';
import 'package:online_exam_app/src/data/model/response/success_auth_reponse_model/success_auth_response_model.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import 'package:online_exam_app/src/domain/entities/success_auth_entity.dart';
import 'package:online_exam_app/src/data/model/response/forget_password_response/forget_password_response_model.dart';

abstract class AuthMapper {
  AppUserEntity toAppUserModel(AppUserModel appUserModel);
  SuccessAuthEntity toForgetPasswordResponseModel(
      ForgetPasswordResponseModel forgetPasswordResponse);

  SuccessAuthEntity toSuccessAuthResponseModel(
      SuccessAuthResponseModel successAuthResponse);
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

  @override
  SuccessAuthEntity toForgetPasswordResponseModel(
      ForgetPasswordResponseModel forgetPasswordResponseModel
      ) {
    return SuccessAuthEntity(massage: forgetPasswordResponseModel.info);
  }

  @override
  SuccessAuthEntity toSuccessAuthResponseModel(
      SuccessAuthResponseModel successAuthResponse) {
    return SuccessAuthEntity(massage: successAuthResponse.message);
  }
}
