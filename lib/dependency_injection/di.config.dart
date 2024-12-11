// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/caching/secure_storge/caching_Data.dart' as _i283;
import '../core/caching/secure_storge/secure_storage.dart' as _i987;
import '../src/data/api/api_manger.dart' as _i793;
import '../src/data/api/network_factory.dart' as _i13;
import '../src/data/data_source/offline_data_source/auth_offline_data_source/auth_offline_data_source.dart'
    as _i191;
import '../src/data/data_source/offline_data_source/auth_offline_data_source/auth_offline_data_source_impl.dart'
    as _i735;
import '../src/data/data_source/online_data_source/auth_data_source/auth_online_data_source.dart'
    as _i625;
import '../src/data/data_source/online_data_source/auth_data_source/auth_online_data_source_impl.dart'
    as _i882;
import '../src/data/data_source/online_data_source/subject_online_data_source/subject_online_data_source.dart'
    as _i816;
import '../src/data/data_source/online_data_source/subject_online_data_source/subject_online_data_source_impl.dart'
    as _i824;
import '../src/data/mappers/auth_mapper.dart' as _i26;
import '../src/data/mappers/subject_mapper.dart' as _i13;
import '../src/data/repositories/auth_repository_impl.dart' as _i762;
import '../src/data/repositories/subject_repository_impl.dart' as _i426;
import '../src/domain/repositories/auth_repository.dart' as _i255;
import '../src/domain/repositories/subject_repository.dart' as _i843;
import '../src/domain/use_case/auth_use_case/change_password_use_case.dart'
    as _i727;
import '../src/domain/use_case/auth_use_case/edit_profile_use_case.dart'
    as _i353;
import '../src/domain/use_case/auth_use_case/forget_password_use_case.dart'
    as _i693;
import '../src/domain/use_case/auth_use_case/get_profile_data_use_case.dart'
    as _i247;
import '../src/domain/use_case/auth_use_case/login_use_case.dart' as _i913;
import '../src/domain/use_case/auth_use_case/logout_use_case.dart' as _i538;
import '../src/domain/use_case/auth_use_case/register_use_case.dart' as _i441;
import '../src/domain/use_case/auth_use_case/reset_password_use_case.dart'
    as _i672;
import '../src/domain/use_case/auth_use_case/verify_reset_code_use_case.dart'
    as _i544;
import '../src/domain/use_case/get_all_subject_use_case.dart' as _i705;
import '../src/presentation/base_screen/view_model/base_cubit.dart' as _i734;
import '../src/presentation/change_password/view_model/change_password_cubit.dart'
    as _i564;
import '../src/presentation/forget_password/view_model/forget_password_cubit.dart'
    as _i868;
import '../src/presentation/login/view_model/login_cubit.dart' as _i803;
import '../src/presentation/profile/view_mdoel/profile_cubit.dart' as _i565;
import '../src/presentation/register/view_model/register_cubit.dart' as _i1059;
import '../src/presentation/reset_password/view_model/reset_password_cubit.dart'
    as _i687;
import '../src/presentation/splash/view_model/splash_cubit.dart' as _i985;
import '../src/presentation/subject/view_modekl/subject_cubit.dart' as _i809;
import '../src/presentation/verify_reset_code/view_model/verify_reset_code_cubit.dart'
    as _i788;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioProvider = _$DioProvider();
    gh.factory<_i734.BaseCubit>(() => _i734.BaseCubit());
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i361.LogInterceptor>(() => dioProvider.providePretty());
    gh.lazySingleton<_i13.AppInterceptors>(() => _i13.AppInterceptors());
    gh.factory<_i283.CachingDataSecureStorage>(
        () => _i987.SecureStorageFunction());
    gh.factory<_i13.SubjectMapper>(() => _i13.SubjectMapperImpl());
    gh.factory<_i793.ApiManger>(() => _i793.ApiManger(gh<_i361.Dio>()));
    gh.factory<_i26.AuthMapper>(() => _i26.AuthMapperImpl());
    gh.factory<_i985.SplashCubit>(
        () => _i985.SplashCubit(gh<_i283.CachingDataSecureStorage>()));
    gh.factory<_i816.SubjectOnlineDataSource>(() =>
        _i824.SubjectOnlineDataSourceImpl(apiManger: gh<_i793.ApiManger>()));
    gh.factory<_i625.AuthOnlineDataSource>(
        () => _i882.AuthOnlineDataSourceImpl(gh<_i793.ApiManger>()));
    gh.factory<_i191.AuthOfflineDataSource>(() =>
        _i735.AuthOfflineDataSourceImpl(
            cachingData: gh<_i283.CachingDataSecureStorage>()));
    gh.factory<_i255.AuthRepository>(() => _i762.AuthRepositoryImpl(
          gh<_i191.AuthOfflineDataSource>(),
          gh<_i625.AuthOnlineDataSource>(),
          gh<_i26.AuthMapper>(),
        ));
    gh.factory<_i843.SubjectRepository>(() => _i426.SubjectRepositoryImpl(
          gh<_i13.SubjectMapper>(),
          subjectOnlineDataSource: gh<_i816.SubjectOnlineDataSource>(),
        ));
    gh.factory<_i727.ChangePasswordUseCase>(() => _i727.ChangePasswordUseCase(
        authRepository: gh<_i255.AuthRepository>()));
    gh.factory<_i693.ForgetPasswordUseCase>(() => _i693.ForgetPasswordUseCase(
        authRepository: gh<_i255.AuthRepository>()));
    gh.factory<_i247.GetProfileDataUseCase>(() => _i247.GetProfileDataUseCase(
        authRepository: gh<_i255.AuthRepository>()));
    gh.factory<_i913.LoginUseCase>(
        () => _i913.LoginUseCase(authRepository: gh<_i255.AuthRepository>()));
    gh.factory<_i538.LogoutUseCase>(
        () => _i538.LogoutUseCase(authRepository: gh<_i255.AuthRepository>()));
    gh.factory<_i441.RegisterUseCase>(() =>
        _i441.RegisterUseCase(authRepository: gh<_i255.AuthRepository>()));
    gh.factory<_i672.ResetPasswordUseCase>(() =>
        _i672.ResetPasswordUseCase(authRepository: gh<_i255.AuthRepository>()));
    gh.factory<_i544.VerifyResetCodeUseCase>(() => _i544.VerifyResetCodeUseCase(
        authRepository: gh<_i255.AuthRepository>()));
    gh.factory<_i353.EditProfileUseCase>(() =>
        _i353.EditProfileUseCase(authRepository: gh<_i255.AuthRepository>()));
    gh.factory<_i564.ChangePasswordCubit>(
        () => _i564.ChangePasswordCubit(gh<_i727.ChangePasswordUseCase>()));
    gh.factory<_i565.ProfileCubit>(() => _i565.ProfileCubit(
          gh<_i353.EditProfileUseCase>(),
          gh<_i247.GetProfileDataUseCase>(),
          gh<_i538.LogoutUseCase>(),
        ));
    gh.factory<_i705.GetAllSubjectUseCase>(() => _i705.GetAllSubjectUseCase(
        subjectRepository: gh<_i843.SubjectRepository>()));
    gh.factory<_i868.ForgetPasswordCubit>(
        () => _i868.ForgetPasswordCubit(gh<_i693.ForgetPasswordUseCase>()));
    gh.factory<_i687.ResetPasswordCubit>(
        () => _i687.ResetPasswordCubit(gh<_i672.ResetPasswordUseCase>()));
    gh.factory<_i788.VerifyResetCodeCubit>(
        () => _i788.VerifyResetCodeCubit(gh<_i544.VerifyResetCodeUseCase>()));
    gh.factory<_i803.LoginCubit>(
        () => _i803.LoginCubit(gh<_i913.LoginUseCase>()));
    gh.factory<_i1059.RegisterCubit>(
        () => _i1059.RegisterCubit(gh<_i441.RegisterUseCase>()));
    gh.factory<_i809.SubjectCubit>(
        () => _i809.SubjectCubit(gh<_i705.GetAllSubjectUseCase>()));
    return this;
  }
}

class _$DioProvider extends _i13.DioProvider {}
