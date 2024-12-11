import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/src/presentation/reset_password/view_model/reset_password_cubit.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../core/utils/functions/validators/validations.dart';
import '../../../../core/utils/widget/app_text_form_feild.dart';

class ResetPasswordFormFieldWidget extends StatelessWidget {
  const ResetPasswordFormFieldWidget({super.key});
  @override
  Widget build(BuildContext context) {
    var resetPasswordViewModel = context.read<ResetPasswordCubit>();
    return Form(
      key: resetPasswordViewModel.formKey,
      child: Column(
        children: [
          CustomTextFromField(
            inputType: TextInputType.visiblePassword,
            controller: resetPasswordViewModel.newPassword,
            validator: (value) => Validations.validatePassword(value),
            hintText: context.localizations.newPassword,
            labelText: context.localizations.newPassword,
          ),

          verticalSpace(20),
          CustomTextFromField(
            inputType: TextInputType.visiblePassword,
            controller: resetPasswordViewModel.confirmPassword,
            validator: (value) => Validations.validateConfirmPassword(value, value),
            hintText: context.localizations.newPassword,
            labelText: context.localizations.newPassword,
          ),
        ],
      ),
    );
  }
}
