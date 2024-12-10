import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/core/utils/widget/app_text_form_feild.dart';
import 'package:online_exam_app/src/presentation/change_password/view_model/change_password_action.dart';
import 'package:online_exam_app/src/presentation/change_password/view_model/change_password_cubit.dart';

import '../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../core/utils/functions/validators/validations.dart';
import '../../../../core/utils/widget/custom_button_widget.dart';

class ChangePasswordFormFieldWidget extends StatelessWidget {
  const ChangePasswordFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var changePasswordViewModel=context.read<ChangePasswordCubit>();
    return  Form(
      key: changePasswordViewModel.formKey,
      child: Column(
        children: [
          CustomTextFromField(
            hintText: context.localizations.currentPassword,
            labelText: context.localizations.currentPassword,
            controller: changePasswordViewModel.oldPassword,
            validator: (value) => Validations.validatePassword(value),
            inputType: TextInputType.visiblePassword,
          ),
          verticalSpace(24),
          CustomTextFromField(
            hintText: context.localizations.newPassword,
            labelText: context.localizations.newPassword,
            controller: changePasswordViewModel.password,
            validator: (value) => Validations.validatePassword(value),
            inputType: TextInputType.visiblePassword,
          ),
          verticalSpace(24),
          CustomTextFromField(
            hintText: context.localizations.confirmPassword,
            labelText: context.localizations.confirmPassword,
            controller: changePasswordViewModel.rePassword,
            validator: (value) =>
                Validations.validateConfirmPassword(
                    changePasswordViewModel.password.text, value),
            inputType: TextInputType.visiblePassword,
          ),
          verticalSpace(48),
          CustomButtonWidget(
            text: context.localizations.update,
            onPressed: () {
            if(changePasswordViewModel.formKey.currentState!.validate()){
              changePasswordViewModel.doAction(GetCallChangePasswordAction());
            }
            },
          )
        ],
      ),
    );
  }
}
