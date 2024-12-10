import 'package:flutter/material.dart';

import 'change_password_form_field_widget.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(18.0),
      child: SingleChildScrollView(child: ChangePasswordFormFieldWidget()),
    );
  }
}
