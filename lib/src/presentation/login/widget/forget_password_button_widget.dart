import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/core/styles/fonts/app_fonts.dart';
import 'package:online_exam_app/src/presentation/login/view_model/login_action.dart';
import 'package:online_exam_app/src/presentation/login/view_model/login_cubit.dart';

class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var loginViewModel=context.read<LoginCubit>();
    return   Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
          onPressed: ()=>loginViewModel.doAction(NavigateToForgetPasswordScreenAction()),
          child: Text(
            context.localizations.forgetPassword,
            style: AppFonts.font13BlackWeight400FontInter.copyWith(
              decoration: TextDecoration.underline
            ),
            textAlign: TextAlign.left,
          ),
        ));

  }
}
