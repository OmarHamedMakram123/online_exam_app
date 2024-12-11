import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/core/utils/functions/validators/validations.dart';
import 'package:online_exam_app/core/utils/widget/app_text_form_feild.dart';

import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../core/styles/fonts/app_fonts.dart';
import '../../../../core/utils/widget/custom_button_widget.dart';
import '../view_model/register_cubit.dart';

class RegisterFormFieldWidget extends StatelessWidget {
  const RegisterFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var registerViewModel = context.read<RegisterCubit>();
    return Form(
        key: registerViewModel.formKey,
        child: Column(children: [
          CustomTextFromField(
            hintText: context.localizations.enterYouUserName,
            labelText: context.localizations.userName,
            controller: registerViewModel.userNameController,
            validator: (value) => Validations.validateName(value),
            inputType: TextInputType.name,
          ),
          verticalSpace(24),
          Row(
            children: [
              Expanded(
                child: CustomTextFromField(
                  hintText: context.localizations.enterFirstName,
                  labelText: context.localizations.firstName,
                  controller: registerViewModel.firstName,
                  validator: (value) => Validations.validateName(value),
                  inputType: TextInputType.name,
                ),
              ),
              horizontalSpace(15),
              Expanded(
                child: CustomTextFromField(
                  hintText: context.localizations.enterYouUserName,
                  labelText: context.localizations.lastName,
                  controller: registerViewModel.lastName,
                  validator: (value) => Validations.validateName(value),
                  inputType: TextInputType.name,
                ),
              ),
            ],
          ),
          verticalSpace(24),
          CustomTextFromField(
            hintText: context.localizations.enterEmail,
            labelText: context.localizations.enterEmail,
            controller:registerViewModel.emailController,
            validator: (value) => Validations.validateEmail(value),
            inputType: TextInputType.emailAddress,
          ),
          verticalSpace(24),
          CustomTextFromField(
            labelText: context.localizations.enterPassword,
            hintText: context.localizations.enterPassword,
            controller: registerViewModel.passwordController,
            inputType: TextInputType.visiblePassword,
            isObscureText: true,
          ),
          verticalSpace(24),
          CustomTextFromField(
            hintText: context.localizations.enterPhone,
            labelText: context.localizations.phone,
            controller: registerViewModel.phoneController,
            validator: (value) => Validations.validatePhoneNumber(value),
            inputType: TextInputType.phone,
          ),
          verticalSpace(24),

        ]));
  }
}
