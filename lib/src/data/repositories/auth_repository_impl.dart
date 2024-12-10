import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/core/api/common/excute_api_method.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/auth_offline_data_source/auth_offline_data_source.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/auth_data_source/auth_online_data_source.dart';
import 'package:online_exam_app/src/data/mappers/auth_mapper.dart';
import 'package:online_exam_app/src/data/model/request/change_password_request.dart';
import 'package:online_exam_app/src/data/model/request/register_request.dart';
import 'package:online_exam_app/src/data/model/request/update_profile_request.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../model/request/login_request.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthOnlineDataSource authOnlineDataSource;
  final AuthOfflineDataSource authOfflineDataSource;
  final AuthMapper authMapper;
  AuthRepositoryImpl(
      this.authOfflineDataSource, this.authOnlineDataSource, this.authMapper);
  @override
  Future<ApiResult<AppUserEntity>> login(
      {required LoginRequest loginRequest}) async {
    return await executeApi(
      apiCall: () async {
        var appUserModel = await authOnlineDataSource.login(loginRequest);
        authOfflineDataSource.saveToken(token: appUserModel.token);
        return authMapper.toAppUserModel(appUserModel);
      },
    );
  }

  @override
  Future<ApiResult<AppUserEntity>> register(
      {required RegisterRequest registerRequest}) async {
    return await executeApi(
      apiCall: () async {
        var appUserModel = await authOnlineDataSource.register(registerRequest);
        return authMapper.toAppUserModel(appUserModel);
      },
    );
  }

  @override
  Future<ApiResult<AppUserEntity>> getProfileData() async {
    return executeApi<AppUserEntity>(
      apiCall: () async {
        var appUserModel = await authOnlineDataSource.getProfileDate();
        return authMapper.toAppUserModel(appUserModel);
      },
    );
  }

  @override
  Future<ApiResult<bool>> changePassword({required ChangePasswordRequest changePasswordRequest})async {
    return executeApi<bool>(apiCall: () async{
      var successResponseModel=await authOnlineDataSource.changePassword(changePasswordRequest: changePasswordRequest);
        print("omar");
      authOfflineDataSource.saveToken(token:successResponseModel.token);
      return Future.value(true);
    },);
  }

  @override
  Future<ApiResult<AppUserEntity>> updateProfile({required UpdateProfileRequest updateProfileRequest}) {
   return executeApi<AppUserEntity>(apiCall: () async{
     var appUserModel= await authOnlineDataSource.updateProfile(updateProfileRequest: updateProfileRequest);
     return authMapper.toAppUserModel(appUserModel);
   },);
  }
}
