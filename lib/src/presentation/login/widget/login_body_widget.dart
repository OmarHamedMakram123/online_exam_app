import 'package:flutter/material.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import '../../../../config/routes/page_route_name.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../core/utils/widget/prom_pto_widet.dart';
import 'forget_password_button_widget.dart';
import 'login_button_submit.dart';
import 'login_form_field_widget.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LoginFormFieldWidget(),
        const ForgetPasswordButtonWidget(),
        verticalSpace(48),
        const LoginButtonSubmit(),
        verticalSpace(16),
        PromPtoWidget(
          text: context.localizations.dontHaveAnAccount,
          textButton: context.localizations.signUp,
          onPressed: () => goNextToRegisterView(context),
        )
      ],
    );
  }

  void goNextToRegisterView(BuildContext context) {
    Navigator.pushNamed(context, PageRouteName.register);
  }
}
