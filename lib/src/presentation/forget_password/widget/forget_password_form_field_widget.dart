import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/src/presentation/forget_password/view_model/forget_password_cubit.dart';

import '../../../../core/utils/functions/validators/validations.dart';
import '../../../../core/utils/widget/app_text_form_feild.dart';

class ForgetPasswordFormFieldWidget extends StatelessWidget {
  const ForgetPasswordFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var forgetPasswordViewModel=context.read<ForgetPasswordCubit>();
    return  Form(
      key: forgetPasswordViewModel.formKey,
      child: CustomTextFromField(
        inputType: TextInputType.emailAddress,
        controller: forgetPasswordViewModel.emailController,
        validator: (value) => Validations.validateEmail(value),
        hintText: context.localizations.email,
        labelText: context.localizations.enterEmail,),
    );
  }
}
