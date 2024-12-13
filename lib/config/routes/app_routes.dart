import 'package:flutter/material.dart';
import 'package:online_exam_app/config/routes/page_route_name.dart';
import 'package:online_exam_app/src/presentation/base_screen/view/base_view.dart';
import 'package:online_exam_app/src/presentation/change_password/view/change_password_view.dart';
import 'package:online_exam_app/src/presentation/exam/view/exam_view.dart';
import 'package:online_exam_app/src/presentation/exam/view/start_exam_view.dart';
import 'package:online_exam_app/src/presentation/exam_score_screen/view/exam_score_screen_view.dart';
import 'package:online_exam_app/src/presentation/forget_password/view/forget_password_view.dart';
import 'package:online_exam_app/src/presentation/questions/view/questions_view.dart';
import 'package:online_exam_app/src/presentation/register/view/register_view.dart';
import 'package:online_exam_app/src/presentation/reset_password/view/reset_password_view.dart';
import 'package:online_exam_app/src/presentation/result/widget/result_answer_widget.dart';
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
      case PageRouteName.exam:
        return _handleMaterialPageRoute(
            widget: const ExamView(), settings: settings);
      case PageRouteName.startExamScreen:
        return _handleMaterialPageRoute(
            widget: const StartExamView(), settings: settings);
      case PageRouteName.questionsScreen:
        return _handleMaterialPageRoute(
            widget: const QuestionsView(), settings: settings);
      case PageRouteName.examScoreScreen:
        return _handleMaterialPageRoute(
            widget: const ExamScoreScreenView(), settings: settings);
      case PageRouteName.resultAnswerScreen:
        return _handleMaterialPageRoute(
            widget: const ResultAnswerQuestionView(), settings: settings);
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
