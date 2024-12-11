import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/request/update_profile_request.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import 'package:online_exam_app/src/domain/use_case/auth_use_case/edit_profile_use_case.dart';
import 'package:online_exam_app/src/domain/use_case/auth_use_case/get_profile_data_use_case.dart';
import 'package:online_exam_app/src/domain/use_case/auth_use_case/logout_use_case.dart';
import 'package:online_exam_app/src/presentation/profile/view_mdoel/profile_action.dart';
import 'package:online_exam_app/src/presentation/profile/view_mdoel/profile_cubit.dart';
import 'profile_cubit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetProfileDataUseCase>(),
  MockSpec<LogoutUseCase>(),
  MockSpec<EditProfileUseCase>()
])
void main() {
  late GetProfileDataUseCase getProfileDataUseCase;
  late LogoutUseCase logoutUseCase;
  late ProfileCubit profileCubit;
  late EditProfileUseCase updateProfileUseCase;
  setUp(
    () {
      getProfileDataUseCase = MockGetProfileDataUseCase();
      logoutUseCase = MockLogoutUseCase();
      updateProfileUseCase = MockEditProfileUseCase();
      profileCubit = ProfileCubit(
          updateProfileUseCase, getProfileDataUseCase, logoutUseCase);
    },
  );
  group(
    "Test Profile Cubit ",
    () {
      group(
        "Test Logout Method doAction Cubit",
        () {
          blocTest<ProfileCubit, ProfileState>(
              "should return emit LogoutLoadingState,LogoutSuccessStata when call doAction(LogoutButton) is successfully",
              build: () {
                var mockedResult = Success<bool>(date: true);
                provideDummy<ApiResult<bool>>(mockedResult);
                when(logoutUseCase.invoke()).thenAnswer(
                  (realInvocation) async => mockedResult,
                );
                return profileCubit;
              },
              act: (bloc) => profileCubit.doAction(LogoutButtonAction()),
              expect: () => <TypeMatcher<ProfileState>>[
                    isA<LogoutLoadingState>(),
                    isA<LogoutSuccessState>(),
                  ]);
          blocTest<ProfileCubit, ProfileState>(
              "should return emit LogoutLoadingState,LogoutFailuresState when call doAction(LogoutButton) is failures",
              build: () {
                var mockedResult = Failures<bool>(exception: Exception());
                provideDummy<ApiResult<bool>>(mockedResult);
                when(logoutUseCase.invoke()).thenAnswer(
                  (realInvocation) async => mockedResult,
                );
                return profileCubit;
              },
              act: (bloc) => profileCubit.doAction(LogoutButtonAction()),
              expect: () => <TypeMatcher<ProfileState>>[
                    isA<LogoutLoadingState>(),
                    isA<LogoutFailuresState>(),
                  ]);
        },
      );
      group(
        "Test Method Update Profile Data",
        () {
          AppUserEntity appUserEntity = AppUserEntity(
              phone: '', lastName: "", email: "", firstName: "", username: "");
          UpdateProfileRequest updateProfileRequest = UpdateProfileRequest(
              username: "username",
              firstName: "firstName",
              lastName: "lastName",
              email: "email",
              phone: "phone");
          blocTest<ProfileCubit, ProfileState>(
              "should return emit[UpdateProfileLoadingState ,UpdateProfileSuccessState] when call doAction(UpdateProfileButtonAction) is successfully",
              build: () {
                var mockedResult = Success<AppUserEntity>(date: appUserEntity);
                provideDummy<ApiResult<AppUserEntity>>(mockedResult);
                when(updateProfileUseCase.invoke(
                        updateProfileRequest: updateProfileRequest))
                    .thenAnswer(
                  (realInvocation) async => mockedResult,
                );
                return profileCubit;
              },
              act: (bloc) => profileCubit.doAction(UpdateProfileButtonAction()),
              expect: () => <TypeMatcher<ProfileState>>[
                    isA<UpdateProfileLoadingState>(),
                    isA<UpdateProfileSuccessState>()
                  ]);
          blocTest<ProfileCubit, ProfileState>(
              "should return emit[UpdateProfileLoadingState ,UpdateProfileFailuresState] when call doAction(UpdateProfileButtonAction) is failures",
              build: () {
                var mockedResult =
                    Failures<AppUserEntity>(exception: Exception());
                provideDummy<ApiResult<AppUserEntity>>(mockedResult);
                when(updateProfileUseCase.invoke(
                        updateProfileRequest: updateProfileRequest))
                    .thenAnswer(
                  (realInvocation) async => mockedResult,
                );
                return profileCubit;
              },
              act: (bloc) => profileCubit.doAction(UpdateProfileButtonAction()),
              expect: () => <TypeMatcher<ProfileState>>[
                    isA<UpdateProfileLoadingState>(),
                    isA<UpdateProfileFailuresState>()
                  ]);
        },
      );
      group(
        "Test GetProfileData Method doAction Cubit",
        () {
          AppUserEntity appUserEntity = AppUserEntity(
              phone: '', lastName: "", email: "", firstName: "", username: "");
          blocTest<ProfileCubit, ProfileState>(
              "should return emit GetProfileLoadingState,GetProfileFailureState when call doAction(GetProfileButtonDataAction) is successfully",
              build: () {
                var mockedResult = Success<AppUserEntity>(
                    date: AppUserEntity(
                        phone: '',
                        lastName: "",
                        email: "",
                        firstName: "",
                        username: ""));
                provideDummy<ApiResult<AppUserEntity>>(mockedResult);
                when(getProfileDataUseCase.invoke()).thenAnswer(
                  (realInvocation) async => mockedResult,
                );
                return profileCubit;
              },
              act: (bloc) => profileCubit.doAction(GetProfileDataAction()),
              expect: () => <TypeMatcher<ProfileState>>[
                    isA<GetProfileDataLoadingState>(),
                    isA<GetProfileDataSuccessState>(),
                  ]);
          blocTest<ProfileCubit, ProfileState>(
              "should return emit GetProfileLoadingState,GetProfileFailures when call doAction(GetProfileButtonDataAction) is failures",
              build: () {
                var mockedResult =
                    Failures<AppUserEntity>(exception: Exception());
                provideDummy<ApiResult<AppUserEntity>>(mockedResult);
                when(getProfileDataUseCase.invoke()).thenAnswer(
                  (realInvocation) async => mockedResult,
                );
                return profileCubit;
              },
              act: (bloc) => profileCubit.doAction(GetProfileDataAction()),
              expect: () => <TypeMatcher<ProfileState>>[
                    isA<GetProfileDataLoadingState>(),
                    isA<GetProfileDataFailuresState>(),
                  ]);
        },
      );
      blocTest<ProfileCubit, ProfileState>(
          "should return emit NavigateToChangePasswordState when call doAction(NavigateToChangePasswordAction) is failures",
          build: () => profileCubit,
          act: (bloc) =>
              profileCubit.doAction(NavigateToChangePasswordAction()),
          expect: () => <TypeMatcher<ProfileState>>[
                isA<NavigateToChangePasswordState>(),
              ]);
      blocTest<ProfileCubit, ProfileState>(
          "should return emit NavigateToLoginState when call doAction(NavigateToCLoginAction) is failures",
          build: () {
            return profileCubit;
          },
          act: (bloc) => profileCubit.doAction(NavigateToLoginScreenAction()),
          expect: () => <TypeMatcher<ProfileState>>[
                isA<NavigateToLoginState>(),
              ]);
      blocTest<ProfileCubit, ProfileState>(
          "should return emit ChangeFormFieldState  when call doAction(ChangeFormFieldAction) ",
          build: () => profileCubit,
          act: (bloc) =>
              profileCubit.doAction(ChangeFormFieldAction(isFormField: true)),
          expect: () => <TypeMatcher<ProfileState>>[
                isA<ChangeFormFiledState>(),
              ]);
      test(
        "should return text title appBar when call titleAppBar is formField =false",
        () {
          profileCubit.isFormField = false;
          var actual = profileCubit.titleAppBar();
          expect(actual, "Profile");
        },
      );
      test(
        "should return text title appBar when call titleAppBar is formField =true",
        () {
          profileCubit.isFormField = true;
          var actual = profileCubit.titleAppBar();
          expect(actual, "Update");
        },
      );
    },
  );
}
