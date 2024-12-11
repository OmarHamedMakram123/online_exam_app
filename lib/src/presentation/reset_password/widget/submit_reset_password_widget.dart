import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/core/utils/widget/custom_button_widget.dart';
import 'package:online_exam_app/src/presentation/reset_password/view_model/reset_password_action.dart';
import 'package:online_exam_app/src/presentation/reset_password/view_model/reset_password_cubit.dart';

class ContinueResetPasswordButtonWidget extends StatelessWidget {
  const ContinueResetPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var resetPasswordViewModel=context.read<ResetPasswordCubit>();
    resetPasswordViewModel.email=ModalRoute.of(context)!.settings.arguments as String;
    return CustomButtonWidget(
      text: context.localizations.continues,
      onPressed: () {
        if(resetPasswordViewModel.formKey.currentState!.validate()){
          resetPasswordViewModel.doAction(ResetPasswordContinueButtonPressedAction());
        }
      },
    );
  }


}
