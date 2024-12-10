import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/constants/api_constants.dart';
import 'package:online_exam_app/src/data/model/request/change_password_request.dart';
import 'package:online_exam_app/src/data/model/request/update_profile_request.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/constants/end_points.dart';
import '../model/request/login_request.dart';
import '../model/request/register_request.dart';
import '../model/response/app_user_model/app_user_model.dart';
import '../model/response/subject_response_model/subject_response_model.dart';
import '../model/response/success_auth_reponse_model/success_response_model.dart';
part 'api_manger.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManger {
  @factoryMethod
  factory ApiManger(
    Dio dio,
  ) = _ApiManger;

  @POST(EndPoints.login)
  Future<AppUserModel> login(@Body() LoginRequest loginRequest);

  @POST(EndPoints.register)
  Future<AppUserModel> register(@Body() RegisterRequest registerRequest);

  @GET(EndPoints.subject)
  Future<SubjectResponseModel> getAllSubject();

  @GET(EndPoints.profileData)
  Future<AppUserModel> getLoggedUserInfo();


  @PUT(EndPoints.editProfile)
  Future<AppUserModel> updateProfileData({@Body() required UpdateProfileRequest updateProfileRequest});

  @PATCH(EndPoints.changePassword)
  Future<SuccessResponseModel> changePassword({@Body() required  ChangePasswordRequest changePasswordRequest});

}
