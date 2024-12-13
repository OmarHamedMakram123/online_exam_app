import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/config/routes/page_route_name.dart';
import 'package:online_exam_app/core/error/error_model.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/core/styles/images/app_image_animations.dart';
import '../../../error/error_massage.dart';
import '../../widget/empty_screen_widget.dart';
import '../../widget/error_screen_widget.dart';

class HandleWidgetState {
  static Widget buildErrorWidget(
      {required BuildContext context,
      required ErrorModel errorModel,
      void Function()? onPressed}) {
    if (errorModel.code == 401 || errorModel.code == 403) {
      return ErrorScreenWidget(
        image: AppImageAnimations.invalidToken,
        text: context.localizations.pleaseEnterLogin,
        errorMassage: ErrorMassage.invalidTokenMassage,
        onPressed: () => _navigateToLogin(context),
      );
    } else {
      return ErrorScreenWidget(
          text: context.localizations.tryAgain,
          errorMassage: errorModel.errorMassage,
          onPressed: onPressed);
    }
  }

  static Widget buildLoadingWidget(BuildContext context) {
    return Center(
        child: Lottie.asset(
            height: 200.h, width: 100.w, AppImageAnimations.loading));
  }

  static Widget buildCheckListEmptyWidget<T>(
      {required List<T> list, required Widget widget}) {
    if (list.isEmpty) {
      return const EmptyScreenWidget();
    } else {
      return widget;
    }
  }

  static void _navigateToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      PageRouteName.login,
      (route) => false,
    );
  }

  static void navigateToPopScreen(BuildContext context){
    if(Navigator.canPop(context)){
      Navigator.pop(context);
    }
  }
}
