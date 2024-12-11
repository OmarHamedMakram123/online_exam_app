part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}


class ResetPasswordLoadingStata extends ResetPasswordState{}
class ResetPasswordSuccessStata extends ResetPasswordState{
  final String massage;
  ResetPasswordSuccessStata({required this.massage});
}
class ResetPasswordErrorStata extends ResetPasswordState{
  final String ? errorMassage;
  ResetPasswordErrorStata({required this.errorMassage});
}

class NavigateToBaseScreenState extends ResetPasswordState {}
