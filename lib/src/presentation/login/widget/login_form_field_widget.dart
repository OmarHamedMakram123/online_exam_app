import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/core/utils/functions/validators/validations.dart';
import 'package:online_exam_app/src/presentation/login/view_model/login_cubit.dart';

import '../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../core/utils/widget/app_text_form_feild.dart';

class LoginFormFieldWidget extends StatelessWidget {
  const LoginFormFieldWidget({super.key});
  @override
  Widget build(BuildContext context) {
    var loginViewModel = context.read<LoginCubit>();
    return Form(
      key: loginViewModel.formKey,
      child: Column(
        children: [
          _buildEmailField(context, loginViewModel.emailController),
          verticalSpace(24),
          _buildPasswordField(context, loginViewModel.passwordController)
        ],
      ),
    );
  }

  Widget _buildEmailField(
      BuildContext context, TextEditingController controller) {
    return CustomTextFromField(
      controller: controller,
      labelText: context.localizations.email,
      hintText: context.localizations.enterEmail,
      validator: Validations.validateEmail,
    );
  }

  Widget _buildPasswordField(
      BuildContext context, TextEditingController controller) {
    return CustomTextFromField(
      controller: controller,
      labelText: context.localizations.password,
      hintText: context.localizations.enterPassword,
      validator: Validations.validatePassword,
    );
  }
}
