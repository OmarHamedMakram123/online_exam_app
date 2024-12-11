import 'package:flutter/material.dart';
import 'package:online_exam_app/config/routes/page_route_name.dart';
import 'package:online_exam_app/src/presentation/base_screen/view/base_view.dart';
import 'package:online_exam_app/src/presentation/change_password/view/change_password_view.dart';
import 'package:online_exam_app/src/presentation/forget_password/view/forget_password_view.dart';
import 'package:online_exam_app/src/presentation/register/view/register_view.dart';
import 'package:online_exam_app/src/presentation/reset_password/view/reset_password_view.dart';
import 'package:online_exam_app/src/presentation/splash/view/splash_view.dart';
import 'package:online_exam_app/src/presentation/verify_reset_code/view/verify_reset_code_view.dart';

import '../../src/presentation/login/view/login_view.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.splash:
        return _handleMaterialPageRoute(
            widget: const SplashView(), settings: settings);
      case PageRouteName.login:
        return _handleMaterialPageRoute(
            widget: const LoginView(), settings: settings);
      case PageRouteName.baseScreen:
        return _handleMaterialPageRoute(
            widget: const BaseView(), settings: settings);
      case PageRouteName.changePassword:
        return _handleMaterialPageRoute(
            widget: const ChangePasswordView(), settings: settings);
      case PageRouteName.forgetPassword:
        return _handleMaterialPageRoute(
            widget: const ForgetPasswordView(), settings: settings);
      case PageRouteName.verifyResetCode:
        return _handleMaterialPageRoute(
            widget: const VerifyResetCodeView(), settings: settings);
      case PageRouteName.resetPassword:
        return _handleMaterialPageRoute(
            widget: const ResetPasswordView(), settings: settings);
      case PageRouteName.register:
        return _handleMaterialPageRoute(
            widget: const RegisterView(), settings: settings);

      default:
        return _handleMaterialPageRoute(
            widget: const LoginView(), settings: settings);
    }
  }

  static MaterialPageRoute<dynamic> _handleMaterialPageRoute(
      {required Widget widget, required RouteSettings settings}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => widget,
    );
  }
}
