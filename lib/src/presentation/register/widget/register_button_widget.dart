import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/core/utils/widget/custom_button_widget.dart';
import 'package:online_exam_app/src/presentation/forget_password/view_model/forget_password_action.dart';

import '../view_model/register_action.dart';
import '../view_model/register_cubit.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<RegisterCubit>();
    return CustomButtonWidget(
      text: context.localizations.signUp,
      onPressed: () {
        if(viewModel.formKey.currentState!.validate()){
          viewModel.doAction(RegisterButtonClickAction());

        }
      },
    );
  }
}
