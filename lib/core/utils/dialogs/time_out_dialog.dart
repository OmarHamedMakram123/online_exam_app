import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/styles/colors/app_colors.dart';

import '../../styles/images/app_images.dart';

class TimeOutDialog{
 static Future<void> showTimeOutDialog(
      {required BuildContext context, required onPressedViewScore}) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) =>
            AlertDialog(

              shape: const BeveledRectangleBorder(),
              backgroundColor: AppColors.kWhite,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.sendTimeOut),
                        SizedBox(width: 5.w),
                        Text(
                          'Time out !!',
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.kError),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 50.w),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.r)),
                        backgroundColor: AppColors.kBlue,
                        side: const BorderSide(color: AppColors.kBlue),
                      ),
                      onPressed: () => onPressedViewScore(),
                      child: Text(
                        "View Score",
                        style: TextStyle(
                            color: AppColors.kWhite,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}