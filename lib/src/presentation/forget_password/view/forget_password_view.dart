import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/routes/page_route_name.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/dependency_injection/di.dart';
import 'package:online_exam_app/src/presentation/forget_password/view_model/forget_password_action.dart';
import 'package:online_exam_app/src/presentation/forget_password/widget/forget_password_body_widget.dart';
import '../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../core/utils/dialogs/loading_dialog.dart';
import '../view_model/forget_password_cubit.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  var forgetPasswordViewModel = getIt.get<ForgetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => forgetPasswordViewModel,
      child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          _handleBlocListerForgetPassword(state);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.localizations.password),
          ),
          body: const ForgetPasswordBodyWidget(),
        ),
      ),
    );
  }



  dynamic _handleBlocListerForgetPassword(ForgetPasswordState state) {
    if (state is ForgetPasswordLoadingState) {
      LoadingDialog.show(context);
    } else if (state is ForgetPasswordErrorState) {
      LoadingDialog.hide(context);
      showAwesomeDialog(
        context,
        title: "Error",
        desc: state.errorModel.errorMassage.toString(),
        onOk: () {},
        dialogType: DialogType.error,
      );
    } else if (state is ForgetPasswordSuccessState) {
      LoadingDialog.hide(context);
      showAwesomeDialog(
        context,
        dismiss: false,
        title: "Success",
        desc:state.massage,
        onOk: ()=>  forgetPasswordViewModel.doAction(NavigateVerifyResetCodeScreenAction()),
        dialogType: DialogType.success,
      );} else if (state is NavigateToVerifyResetCodeState)
      {
      _navigateToVerifyResetCodeState();
    }
  }

  void _navigateToVerifyResetCodeState() {
    Navigator.pushNamed(context, PageRouteName.verifyResetCode,arguments:forgetPasswordViewModel.emailController.text );
  }
}
