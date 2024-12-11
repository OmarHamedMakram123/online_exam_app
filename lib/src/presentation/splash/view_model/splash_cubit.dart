import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/core/caching/cache_keys.dart';

import '../../../../config/routes/page_route_name.dart';
import '../../../../core/caching/secure_storge/caching_Data.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  CachingDataSecureStorage cachingDataSecureStorage;
  SplashCubit(this.cachingDataSecureStorage) : super(SplashInitial());

  String routeName = PageRouteName.login;
  Future<void> getRouteName() async {
    String? token = await cachingDataSecureStorage.readData(key: CacheKeys.token);
    if (token != null && token.isNotEmpty) {
      routeName = PageRouteName.baseScreen;
    } else {
      routeName = PageRouteName.login;
    }
    emit(GoReturnRouteNameState());
  }
}
