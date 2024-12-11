part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}


class GetProfileDataLoadingState extends ProfileState{}
class GetProfileDataSuccessState extends ProfileState{}
class GetProfileDataFailuresState extends ProfileState{
  final ErrorModel errorModel;
  GetProfileDataFailuresState({required this.errorModel});
}

class NavigateToChangePasswordState extends ProfileState{}
class NavigateToLoginState extends ProfileState{}

class LogoutLoadingState extends ProfileState{}
class LogoutSuccessState extends ProfileState{}
class LogoutFailuresState extends ProfileState{
  final ErrorModel errorModel;
  LogoutFailuresState({required this.errorModel});
}

class UpdateProfileLoadingState extends ProfileState{}
class UpdateProfileSuccessState extends ProfileState{}
class UpdateProfileFailuresState extends ProfileState{
  final ErrorModel errorModel;
  UpdateProfileFailuresState({required this.errorModel});
}

class ChangeFormFiledState extends ProfileState{}