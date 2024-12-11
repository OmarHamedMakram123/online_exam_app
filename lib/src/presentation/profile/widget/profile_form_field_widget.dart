import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:online_exam_app/core/utils/functions/validators/validations.dart';
import 'package:online_exam_app/src/domain/entities/app_user_entity.dart';
import 'package:online_exam_app/src/presentation/profile/view_mdoel/profile_action.dart';
import '../../../../core/utils/widget/app_text_form_feild.dart';
import '../view_mdoel/profile_cubit.dart';

class ProfileFormFieldWidget extends StatefulWidget {
  const ProfileFormFieldWidget({super.key});

  @override
  State<ProfileFormFieldWidget> createState() => _ProfileFormFieldWidgetState();
}

class _ProfileFormFieldWidgetState extends State<ProfileFormFieldWidget> {
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).profilePopularFields(
        userEntity: BlocProvider.of<ProfileCubit>(context).appUserEntity ??
            AppUserEntity(
                username: "",
                firstName: "",
                lastName: "",
                email: "",
                phone: ""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var profileViewModel = BlocProvider.of<ProfileCubit>(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Form(
            key: profileViewModel.formKey,
            child: Column(children: [
              CustomTextFromField(
                onChanged: (p0) {
                  profileViewModel
                      .doAction(ChangeFormFieldAction(isFormField: true));
                },
                hintText: profileViewModel.appUserEntity?.username ?? "",
                labelText: context.localizations.userName,
                controller: profileViewModel.userNameController,
                validator: (value) => Validations.validateName(value),
                inputType: TextInputType.name,
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFromField(
                      onChanged: (p0) {
                        profileViewModel
                            .doAction(ChangeFormFieldAction(isFormField: true));
                      },
                      hintText: profileViewModel.appUserEntity?.firstName ?? "",
                      labelText: context.localizations.firstName,
                      controller: profileViewModel.firstNameController,
                      validator: (value) => Validations.validateName(value),
                      inputType: TextInputType.name,
                    ),
                  ),
                  verticalSpace(16),
                  Expanded(
                    child: CustomTextFromField(
                      onChanged: (p0) {
                        profileViewModel
                            .doAction(ChangeFormFieldAction(isFormField: true));
                      },
                      hintText: profileViewModel.appUserEntity?.lastName ?? "",
                      labelText: context.localizations.lastName,
                      controller: profileViewModel.lastNameController,
                      validator: (value) => Validations.validateName(value),
                      inputType: TextInputType.name,
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              CustomTextFromField(
                onChanged: (p0) {
                  profileViewModel
                      .doAction(ChangeFormFieldAction(isFormField: true));
                },
                hintText: profileViewModel.appUserEntity?.email ?? "",
                labelText: context.localizations.enterEmail,
                controller: profileViewModel.emailController,
                validator: (value) => Validations.validateEmail(value),
                inputType: TextInputType.emailAddress,
              ),
              verticalSpace(24),
              CustomTextFromField(
                labelText: "",
                hintText: "***********",
                controller: TextEditingController(text: "**********"),
                inputType: TextInputType.none,
                isObscureText: true,
                suffixIcon: TextButton(
                  onPressed: () => profileViewModel
                      .doAction(NavigateToChangePasswordAction()),
                  child: Text(context.localizations.change),
                ),
              ),
              verticalSpace(24),
              CustomTextFromField(
                onChanged: (p0) {
                  profileViewModel
                      .doAction(ChangeFormFieldAction(isFormField: true));
                },
                hintText: profileViewModel.appUserEntity?.phone ?? "",
                labelText: context.localizations.phone,
                controller: profileViewModel.phoneController,
                validator: (value) => Validations.validatePhoneNumber(value),
                inputType: TextInputType.phone,
              ),
            ]));
      },
    );
  }
}
