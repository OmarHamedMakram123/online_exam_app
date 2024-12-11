import '../../../model/response/app_user_model/app_user_model.dart';

abstract class AuthOfflineDataSource{
  Future<void>saveToken({required String ? token});
  Future<void>deleteToken();
}