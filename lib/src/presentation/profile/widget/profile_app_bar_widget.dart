import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/presentation/profile/view_mdoel/profile_cubit.dart';

import '../view_mdoel/profile_action.dart';

class ProfileAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var profileViewModel = context.read<ProfileCubit>();

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return AppBar(
          title: Text(profileViewModel.titleAppBar()),
          leading: profileViewModel.isFormField
              ? IconButton(
            onPressed: () {
               profileViewModel.doAction(ChangeFormFieldAction(isFormField: false));
              profileViewModel.doAction(GetProfileDataAction());
               profileViewModel.resetFormField();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          )
              : null,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
