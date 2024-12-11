part of 'verify_reset_code_cubit.dart';

@immutable
sealed class VerifyResetCodeState {}

final class VerifyResetCodeInitial extends VerifyResetCodeState {}
class VerifyCodeLoadingStata extends VerifyResetCodeState{}
class VerifyCodeSuccessStata extends VerifyResetCodeState{
  final String ? massage;
  VerifyCodeSuccessStata({required this.massage});

}
class VerifyCodeErrorStata extends VerifyResetCodeState{
  final String ? errorMassage;
  VerifyCodeErrorStata({required this.errorMassage});
}


class NavigateToResetPasswordScreenState extends VerifyResetCodeState{}