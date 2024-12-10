import 'package:flutter/material.dart';

import '../../../../core/styles/fonts/app_fonts.dart';

class PromPtoWidget extends StatelessWidget {
  final String text;
  final String textButton;
  final void Function()? onPressed;
  const PromPtoWidget(
      {super.key,
      required this.text,
      required this.textButton,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppFonts.font16kBlackWeight400FontInter),
        TextButton(
          onPressed: onPressed,
          child: Text(textButton,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.font16kBlueWeight500FontInter.copyWith(
                decoration: TextDecoration.underline
              )),
        ),
      ],
    );
  }
}
