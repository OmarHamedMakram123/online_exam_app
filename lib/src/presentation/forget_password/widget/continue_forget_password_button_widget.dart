import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/extension/extension.dart';

import '../../../../core/utils/widget/custom_button_widget.dart';
import '../view_model/forget_password_action.dart';
import '../view_model/forget_password_cubit.dart';

class ContinueForgetPasswordButtonWidget extends StatelessWidget {
  const ContinueForgetPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var forgetPasswordViewModel = context.read<ForgetPasswordCubit>();
    return CustomButtonWidget(
        onPressed: () => checkValidationEmail(forgetPasswordViewModel),
        text: context.localizations.continues);
  }

  void checkValidationEmail(ForgetPasswordCubit forgetPasswordCubit) {
    if (forgetPasswordCubit.formKey.currentState!.validate()) {
      forgetPasswordCubit.doAction(OnClickForgetPasswordAction());
    }
  }
}
