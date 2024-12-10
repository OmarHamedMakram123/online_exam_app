import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam_app/core/styles/images/app_image_animations.dart';
import '../../styles/images/app_images.dart';

class EmptyScreenWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const EmptyScreenWidget({super.key, this.text="The list is empty! There's nothing to show here. ", this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppImageAnimations.cartEmpty, height: 180.h),
          Text(
              textAlign: TextAlign.center,
              text,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 14.h,
          ),
        ],
      ),
    );
  }
}
