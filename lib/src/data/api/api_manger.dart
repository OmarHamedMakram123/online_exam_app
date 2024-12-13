import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/constants/api_constants.dart';
import 'package:online_exam_app/src/data/model/request/change_password_request.dart';
import 'package:online_exam_app/src/data/model/request/check_answer_request.dart';
import 'package:online_exam_app/src/data/model/request/update_profile_request.dart';
import 'package:online_exam_app/src/data/model/response/exam_response_model/exam_response_model.dart';
import 'package:online_exam_app/src/data/model/response/forget_password_response/forget_password_response_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/constants/end_points.dart';
import '../model/request/forget_password_request.dart';
import '../model/request/login_request.dart';
import '../model/request/register_request.dart';
import '../model/request/reset_password_request.dart';
import '../model/request/verify_reset_code_request.dart';
import '../model/response/app_user_model/app_user_model.dart';
import '../model/response/check_answer_model/check_answer_question_model.dart';
import '../model/response/question_response_model/question_response_model.dart';
import '../model/response/subject_response_model/subject_response_model.dart';
import '../model/response/success_auth_reponse_model/success_auth_response_model.dart';
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
  Future<AppUserModel> updateProfileData(
      {@Body() required UpdateProfileRequest updateProfileRequest});

  @PATCH(EndPoints.changePassword)
  Future<SuccessAuthResponseModel> changePassword(
      {@Body() required ChangePasswordRequest changePasswordRequest});

  @GET(EndPoints.logOut)
  Future<String> logoOut();

  @POST(EndPoints.forgotPassword)
  Future<ForgetPasswordResponseModel> forgetPassword(
      {@Body() required ForgetPasswordRequest forgetPasswordRequest});
  @POST(EndPoints.verifyResetCode)
  Future<SuccessAuthResponseModel> verifyResetCode(
      {@Body() required VerifyResetCodeRequest verifyRestCode});
  @PUT(EndPoints.resetPassword)
  Future<SuccessAuthResponseModel> resetPassword(
      {@Body() required ResetPasswordRequest resetPasswordRequest});
  
  @GET(EndPoints.getAllExam)
  Future<ExamResponseModel> getExamOnSubjectId(
      {@Query("subject")  required String subjectId });


   @GET(EndPoints.questions)
  Future<QuestionResponseModel>getQuestionOnExamById({@Query("exam") required String examId});


  @POST(EndPoints.checkAnswer)
  Future<CheckAnswerQuestionModel>checkAnswerQuestion(@Body() CheckAnswerRequest checkAnswerRequest);

}
