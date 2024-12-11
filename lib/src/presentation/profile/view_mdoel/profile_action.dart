sealed  class ProfileAction{}
class GetProfileDataAction extends ProfileAction{}
class LogoutButtonAction extends ProfileAction{}
class UpdateProfileButtonAction extends ProfileAction{}
class ChangeFormFieldAction extends ProfileAction{
  final bool isFormField;
  ChangeFormFieldAction({required this.isFormField});
}
class NavigateToChangePasswordAction extends ProfileAction{}
class NavigateToLoginScreenAction extends ProfileAction{}