part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {}

class ChangePasswordFailuresState extends ChangePasswordState {
  final ErrorModel errorModel;
  ChangePasswordFailuresState({required this.errorModel});
}
