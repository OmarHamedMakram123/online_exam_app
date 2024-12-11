sealed  class VerifyResetCodeAction{}
class VerifyResetCompletedAction extends VerifyResetCodeAction{
  final String value;
  VerifyResetCompletedAction({required this.value});
}
class NavigateToResetPasswordAction extends VerifyResetCodeAction{}
