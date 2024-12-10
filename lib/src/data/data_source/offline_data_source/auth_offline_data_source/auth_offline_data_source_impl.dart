import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/caching/secure_storge/caching_Data.dart';
import '../../../../../core/caching/cache_keys.dart';
import 'auth_offline_data_source.dart';

@Injectable(as:AuthOfflineDataSource )
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource {
  final CachingDataSecureStorage cachingData  ;
  AuthOfflineDataSourceImpl({required this.cachingData});

  @override
  Future<void> saveToken({required String? token}) async {
    if (token != null) {
      return await cachingData.writeData(key: CacheKeys.token, value: token);
    } else {
      throw Exception("Token Is Empty");
    }
  }
}
