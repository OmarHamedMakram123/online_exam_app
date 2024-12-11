part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {
 final String massage;
  ForgetPasswordSuccessState({required this.massage});

}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final ErrorModel errorModel;
  ForgetPasswordErrorState({required this.errorModel});
}

class NavigateToVerifyResetCodeState extends ForgetPasswordState {}
