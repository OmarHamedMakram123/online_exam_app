import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/src/presentation/login/view/login_view.dart';
import 'package:online_exam_app/src/presentation/login/view_model/login_cubit.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/utils/widget/custom_button_widget.dart';
import '../view_model/login_action.dart';

class LoginButtonSubmit extends StatelessWidget {
  const LoginButtonSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    var loginViewModel=context.read<LoginCubit>();
    return CustomButtonWidget(
      text: context.localizations.login,
      onPressed: (){
        if(loginViewModel.formKey.currentState!.validate()){
          loginViewModel.doAction(ButtonLoginAction());
        }
      },
    );
  }

}

