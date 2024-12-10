import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/core/styles/colors/app_colors.dart';
import 'package:online_exam_app/core/utils/functions/validators/validations.dart';
import 'package:online_exam_app/src/presentation/profile/view_mdoel/profile_action.dart';

import '../../../../../../config/routes/page_route_name.dart';
import '../../../../core/utils/widget/app_text_form_feild.dart';
import '../../../../core/utils/widget/custom_button_widget.dart';
import '../view_mdoel/profile_cubit.dart';

class ProfileFormFieldWidget extends StatefulWidget {
  const ProfileFormFieldWidget({super.key});

  @override
  State<ProfileFormFieldWidget> createState() => _ProfileFormFieldWidgetState();
}

class _ProfileFormFieldWidgetState extends State<ProfileFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    var profileViewModel = BlocProvider.of<ProfileCubit>(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Form(
            key: profileViewModel.formKey,
            // onChanged: () {
            //   if (profileViewModel.isFormField) {
            //     profileViewModel.doAction(
            //         ChangeFormFieldEvent(isFormField: false));
            //   }
            // },
            child: Column(children: [
              CustomTextFromField(
                hintText: profileViewModel.appUserEntity?.username ?? "",
                labelText: context.localizations.userName,
                controller: TextEditingController(),
                validator: (value) =>Validations.validateName(value),
                inputType: TextInputType.name,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFromField(
                      hintText: profileViewModel.appUserEntity?.firstName ?? "",
                      labelText: context.localizations.firstName,
                      controller: TextEditingController(),
                      validator: (value) =>Validations.validateName(value),
                      inputType: TextInputType.name,
                    ),
                  ),
                  SizedBox(width: 16.h),
                  Expanded(
                    child: CustomTextFromField(
                      hintText: profileViewModel.appUserEntity?.lastName ?? "",
                      labelText: context.localizations.lastName,
                      controller: TextEditingController(),
                      validator: (value) =>Validations.validateName(value),
                      inputType: TextInputType.name,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              CustomTextFromField(
                hintText: profileViewModel.appUserEntity?.email ?? "",
                labelText: context.localizations.enterEmail,
                controller: TextEditingController(),
                validator: (value) =>Validations.validateEmail(value),
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24.h),
              CustomTextFromField(
                labelText: "",
                hintText: "***********",
                controller: TextEditingController(text: "**********"),
                inputType: TextInputType.none,
                isObscureText: true,
                suffixIcon: TextButton(
                  onPressed: () => profileViewModel.doAction(NavigateToChangePasswordAction()),
                  child:  Text(context.localizations.change),
                ),
              ),
              SizedBox(height: 24.h),
              CustomTextFromField(
                hintText: profileViewModel.appUserEntity?.phone ?? "",
                labelText: context.localizations.phone,
                controller: TextEditingController(),
                validator: (value) =>Validations.validatePhoneNumber(value),
                inputType: TextInputType.phone,
              ),
              SizedBox(height: 24.h),
              CustomButtonWidget(
                text: context.localizations.update,
              //  color: AppColors.kGray,
                cheekBackGroundColor: true,
                onPressed: () {

                },
              ),
            ]));
      },
    );
  }

  // void updatePasswordButton(ProfileCubit profileViewModel) {
  //   if (!profileViewModel.isFormField) {
  //     profileViewModel.doAction(ChangeFormFieldEvent(isFormField: true));
  //     if (profileViewModel.formKey.currentState!.validate()) {
  //       profileViewModel.doAction(EditProfileEvent()).then((value) {
  //         profileViewModel.doAction(GetUserInfoEvent());
  //         profileViewModel.doAction(ResetFormFieldEvent());
  //       });
  //     }
  //   }


  void goNextToChangePassword() {
     Navigator.pushNamed(context, PageRouteName.resetPassword);
  }
}
