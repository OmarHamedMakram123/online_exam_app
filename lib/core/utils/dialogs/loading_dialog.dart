import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/styles/images/app_image_animations.dart';

class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
       return  Center(
         child: Lottie.asset(
           AppImageAnimations.loading,
           width: 150.w,
           height: 150.h,
           fit: BoxFit.cover,
         ),
       );
      },
    );
  }
  static void hide(BuildContext context) {
    if(Navigator.canPop(context)){
      Navigator.pop(context);
    }
  }
}