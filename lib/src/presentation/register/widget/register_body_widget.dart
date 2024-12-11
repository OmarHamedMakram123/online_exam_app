import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/src/presentation/register/view_model/register_action.dart';
import 'package:online_exam_app/src/presentation/register/widget/register_button_widget.dart';
import 'package:online_exam_app/src/presentation/register/widget/register_form_field_widget.dart';

import '../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../core/utils/widget/prom_pto_widet.dart';
import '../view_model/register_cubit.dart';

class RegisterBodyWidget extends StatelessWidget {
  const RegisterBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<RegisterCubit>();
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RegisterFormFieldWidget(),
              verticalSpace(30),
              const RegisterButtonWidget(),
              verticalSpace(20),
              PromPtoWidget(
                text: " ${context.localizations.alreadyHaveAnAccount}? ",
                textButton: context.localizations.login,
                onPressed: () => viewModel.doAction(NavigateToLoginAction()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
