import 'package:flutter/material.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/src/presentation/verify_reset_code/widget/pin_code_field_widget.dart';
import '../../../../core/styles/fonts/app_fonts.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../core/utils/widget/prom_pto_widet.dart';

class VerifyResetCodeBody extends StatelessWidget {
  const VerifyResetCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.localizations.emailVerification,
              style: AppFonts.font18kBlue0Weight500FontInter,
            ),
            verticalSpace(16),
            Text(
              textAlign: TextAlign.center,
              context.localizations.titleEmailVerification,
              style: AppFonts.font14GrayWeight400FontInter,
            ),
            verticalSpace(32),
            const PinCodeFieldWidget(),
            verticalSpace(48),
            PromPtoWidget(
              text: context.localizations.didNtReceiveCode,
              textButton: context.localizations.resend,
            )
          ],
        ),
      ),
    );
  }
}
