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