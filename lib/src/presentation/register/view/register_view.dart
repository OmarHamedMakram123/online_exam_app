import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/routes/page_route_name.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/dependency_injection/di.dart';
import 'package:online_exam_app/src/presentation/login/view_model/login_action.dart';
import 'package:online_exam_app/src/presentation/register/view_model/register_cubit.dart';
import '../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../core/utils/dialogs/loading_dialog.dart';
import '../view_model/register_action.dart';
import '../widget/register_body_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var registerViwModel = getIt.get<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registerViwModel,
      child: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) => _handleBlocListenerState(state),
          child: Scaffold(
            appBar: AppBar(
              title: Text(context.localizations.signUp),
            ),
            body: const RegisterBodyWidget(),
          )),
    );
  }

  void _handleBlocListenerState(RegisterState state) {
    if (state is RegisterLoadingState) {
      LoadingDialog.show(context);
    } else if (state is RegisterErrorState) {
      LoadingDialog.hide(context);
      showAwesomeDialog(
        context,
        title: "Error",
        desc: state.errorMassage.toString(),
        onOk: () {},
        dialogType: DialogType.error,
      );
    } else if (state is RegisterSuccessState) {
      LoadingDialog.hide(context);
      registerViwModel.doAction(NavigateToMainAction());
    } else if (state is NavigateToMainViewState) {
      LoadingDialog.hide(context);
      return _navigateToBaseScreen();
    } else if (state is NavigateToLoginState) {
      return _navigateToLogin();
    }
  }

  void _navigateToBaseScreen() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      PageRouteName.baseScreen,
      (route) => false,
    );
  }

  void _navigateToLogin() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      PageRouteName.login,
      (route) => false,
    );
  }
}
