import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/colors/app_colors.dart';

class CustomTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final bool isObscureText;
  final TextInputType inputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final int maxLine;
  const CustomTextFromField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.validator,
    this.isObscureText = false,
    this.inputType = TextInputType.none,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLine = 1,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: inputType,
      obscureText: isObscureText,
      maxLines: maxLine,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        errorMaxLines: 1,
        helperMaxLines: 1,
        fillColor: AppColors.kWhite,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.kBlack,
        ),
        suffixIcon: suffixIcon,
        labelText: labelText,
        enabled: true,
        floatingLabelStyle:
        MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.error)) {
            return const TextStyle(color: AppColors.kRed);
          } else if (states.contains(MaterialState.focused)) {
            return TextStyle(color: AppColors.kGray);
          }
          return const TextStyle(color: Colors.grey);
        }),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.kGray,
        ),
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.sp),
          borderSide: BorderSide(
            color: AppColors.kGray,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kGray,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kGray,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kRed,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kRed,
          ),
        ),
        errorStyle: const TextStyle(
          color: AppColors.kRed,
          fontSize: 14,
        ),
      ),
    );
  }
}
