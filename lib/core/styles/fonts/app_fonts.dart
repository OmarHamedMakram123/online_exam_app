
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';

class AppFonts{
 static  const String  _fontInter="Inter";


  static TextStyle font2kBlack0Weight500=
     TextStyle(
        fontSize: 20.sp,
        fontFamily: _fontInter,
        fontWeight: FontWeight.w500,
        color: AppColors.kBlack
    );

 static TextStyle font20kBlue0Weight500FontInter=TextStyle(
   fontSize: 20.sp,
   color: AppColors.kBlue,
   fontFamily: _fontInter,

   fontWeight: FontWeight.w500,

 );

 static TextStyle font18kBlue0Weight500FontInter=TextStyle(
   fontSize: 18.sp,
   color: AppColors.kBlack,
   fontFamily: _fontInter,

   fontWeight: FontWeight.w500,

 );
  static TextStyle font16KWhiteWeight500=TextStyle(
    fontSize: 16.sp,
    color: AppColors.kWhite,
   fontWeight: FontWeight.w600,
  );

  static TextStyle font16kBlueWeight500FontInter=TextStyle(
      fontSize: 16.sp,
      fontFamily: _fontInter,
      fontWeight: FontWeight.w500,
      color: AppColors.kBlue
  );


 static TextStyle font16kBlackWeight400FontInter=TextStyle(
     fontSize: 16.sp,
     fontFamily: _fontInter,
     fontWeight: FontWeight.w400,
     color: AppColors.kBlack
 );

 static TextStyle font16kBlackWeight500Font=TextStyle(
     fontSize: 16.sp,
     fontWeight: FontWeight.w500,
     color: AppColors.kBlack
 );


 static TextStyle font13BlackWeight400FontInter=TextStyle(
     fontSize: 13.sp,
     fontFamily: _fontInter,
     fontWeight: FontWeight.w400,
     color: AppColors.kBlack
 );
 static TextStyle font16BlackWeight400FontInter=TextStyle(
   fontSize: 16.sp,
   color: AppColors.kBlack,
   fontWeight: FontWeight.w400,
   fontFamily: _fontInter
 );
}