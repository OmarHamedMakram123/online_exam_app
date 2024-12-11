import 'package:flutter/cupertino.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import '../../../../core/styles/fonts/app_fonts.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart';
import 'continue_forget_password_button_widget.dart';
import 'forget_password_form_field_widget.dart';

class ForgetPasswordBodyWidget extends StatelessWidget {
  const ForgetPasswordBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.localizations.forgetPassword,
              style: AppFonts.font18kBlue0Weight500FontInter,
            ),
            verticalSpace(
              16,
            ),
            Text(
              textAlign: TextAlign.start,
              context.localizations.titleForgetPassword,
              style: AppFonts.font13BlackWeight400FontInter,
            ),
            verticalSpace(32),
            const ForgetPasswordFormFieldWidget(),
            verticalSpace(48),
            const ContinueForgetPasswordButtonWidget(),
          ],
        ),
      ),
    );
  }
}
