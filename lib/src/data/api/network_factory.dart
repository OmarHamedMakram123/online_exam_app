import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/constants/api_constants.dart';
import 'package:online_exam_app/core/caching/cache_keys.dart';
import 'package:online_exam_app/dependency_injection/di.dart';
import '../../../core/caching/secure_storge/caching_Data.dart';


@module
abstract class DioProvider {
  @lazySingleton
  Dio dioProvider() {
    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: ApiConstants.duration),
        sendTimeout: const Duration(seconds: ApiConstants.duration),
        receiveTimeout: const Duration(seconds: ApiConstants.duration),
      ),
    );
    dio.interceptors.add(providePretty());
    dio.interceptors.add(AppInterceptors());
    return dio;
  }

  @lazySingleton
  LogInterceptor providePretty() {
    return LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      request: true,
    );
  }
}
@lazySingleton
class AppInterceptors extends InterceptorsWrapper{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    String ? token=await getIt.get<CachingDataSecureStorage>().readData(key:CacheKeys.token);
    if(token !=null){
     options.headers["token"] =token ;
   }
    super.onRequest(options, handler);
  }



}
