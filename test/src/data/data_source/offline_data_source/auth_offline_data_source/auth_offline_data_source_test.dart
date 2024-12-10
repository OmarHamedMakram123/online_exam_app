import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/caching/cache_keys.dart';
import 'package:online_exam_app/core/caching/secure_storge/caching_Data.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/auth_offline_data_source/auth_offline_data_source.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/auth_offline_data_source/auth_offline_data_source_impl.dart';
import 'auth_offline_data_source_test.mocks.dart';

@GenerateMocks([CachingDataSecureStorage])
void main() {
  late AuthOfflineDataSource authOfflineDataSource;
  late CachingDataSecureStorage cachingDataSecureStorage;
  setUp(
    () {
      cachingDataSecureStorage = MockCachingDataSecureStorage();
      authOfflineDataSource =
          AuthOfflineDataSourceImpl(cachingData: cachingDataSecureStorage);
    },
  );
  group(
    "Test AuthOffline Data Source ",
    () {
      group(
        'Test Save Token ',
        () {
          test(
            "should saveToken when call authOfflineDataSource.saveToken  if token is not Empty",
            () async {
              String fakeToken = "fakeToken";
              when(cachingDataSecureStorage.writeData(
                      key: "key", value: fakeToken))
                  .thenAnswer(
                (realInvocation) async => {},
              );
              await authOfflineDataSource.saveToken(token: fakeToken);
              verify(cachingDataSecureStorage.writeData(
                key: CacheKeys.token,
                value: fakeToken,
              )).called(1);
            },
          );
          test(
            "should return Exception when call authOfflineDataSource.saveToken if token is Empty ",
            () async {
              String?  token;
              var actual=authOfflineDataSource.saveToken(token: token);
              expect(actual, throwsA(isA<Exception>()));
            },
          );
        },
      );
    },
  );
}
