import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/routes/page_route_name.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/core/utils/functions/handle_widget_state/handle_widget_state.dart';
import 'package:online_exam_app/dependency_injection/di.dart';
import 'package:online_exam_app/src/presentation/change_password/view_model/change_password_cubit.dart';
import 'package:online_exam_app/src/presentation/profile/view_mdoel/profile_action.dart';
import 'package:online_exam_app/src/presentation/profile/view_mdoel/profile_cubit.dart';

import '../widget/profile_form_field_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var profileViewModel = getIt.get<ProfileCubit>();
  @override
  void initState() {
    profileViewModel.doAction(GetProfileDataAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileViewModel,
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is NavigateToChangePasswordState) {
            _navigateTOChangePassword();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.localizations.profile),
          ),
          body: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is GetProfileDataLoadingState) {
                return HandleWidgetState.buildLoadingWidget(context);
              } else if (state is GetProfileDataFailuresState) {
                return HandleWidgetState.buildErrorWidget(
                  context: context,
                  errorModel: state.errorModel,
                  onPressed: () =>
                      profileViewModel.doAction(GetProfileDataAction()),
                );
              }
              return const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: ProfileFormFieldWidget(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _navigateTOChangePassword() {
    Navigator.pushNamed(context, PageRouteName.changePassword);
  }
}
