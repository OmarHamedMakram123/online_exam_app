import 'package:flutter/material.dart';
import 'package:online_exam_app/config/routes/page_route_name.dart';
import 'package:online_exam_app/src/presentation/base_screen/view/base_view.dart';
import 'package:online_exam_app/src/presentation/change_password/view/change_password_view.dart';

import '../../src/presentation/login/view/login_view.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.login:
        return _handleMaterialPageRoute(
            widget: const LoginView(), settings: settings);
      case PageRouteName.baseScreen:
        return _handleMaterialPageRoute(
            widget: const BaseView(), settings: settings);
      case PageRouteName.changePassword:
        return _handleMaterialPageRoute(
            widget: const ChangePasswordView(), settings: settings);

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
