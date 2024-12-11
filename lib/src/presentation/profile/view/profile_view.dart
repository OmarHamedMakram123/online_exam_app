import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/routes/page_route_name.dart';
import 'package:online_exam_app/core/utils/dialogs/loading_dialog.dart';
import 'package:online_exam_app/core/utils/functions/handle_widget_state/handle_widget_state.dart';
import 'package:online_exam_app/dependency_injection/di.dart';
import 'package:online_exam_app/src/presentation/profile/view_mdoel/profile_action.dart';
import 'package:online_exam_app/src/presentation/profile/view_mdoel/profile_cubit.dart';
import 'package:online_exam_app/src/presentation/profile/widget/profile_app_bar_widget.dart';

import '../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../domain/entities/app_user_entity.dart';
import '../widget/profile_body_widget.dart';

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
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) => _handleProfileListener(state),
          builder: (context, state) => Scaffold(
              appBar: const ProfileAppBarWidget(),
              body: _handleProfileBlocBuilderWidget(state)),
        ));
  }

  void _handleProfileListener(ProfileState state) {
    if (state is NavigateToChangePasswordState) {
      _navigateTOChangePassword();
    } else if (state is LogoutLoadingState ||
        state is UpdateProfileLoadingState) {
      LoadingDialog.show(context);
    } else if (state is LogoutSuccessState) {
      LoadingDialog.hide(context);
      profileViewModel.doAction(NavigateToLoginScreenAction());
    } else if (state is UpdateProfileSuccessState) {
      LoadingDialog.hide(context);
      profileViewModel.resetFormField();
      profileViewModel.doAction(ChangeFormFieldAction(isFormField: false));
      profileViewModel.doAction(GetProfileDataAction());
    } else if (state is UpdateProfileFailuresState) {
      LoadingDialog.hide(context);
      showAwesomeDialog(
        context,
        title: "Error",
        desc: state.errorModel.errorMassage.toString(),
        onOk: () {},
        dialogType: DialogType.error,
      );
    } else if (state is LogoutFailuresState) {
      LoadingDialog.hide(context);
      showAwesomeDialog(
        context,
        title: "Error",
        desc: state.errorModel.errorMassage.toString(),
        onOk: () {},
        dialogType: DialogType.error,
      );
    } else if (state is NavigateToLoginState) {
      LoadingDialog.hide(context);
      Navigator.pushNamedAndRemoveUntil(
        context,
        PageRouteName.login,
        (route) => false,
      );
    }
  }

  Widget _handleProfileBlocBuilderWidget(ProfileState state) {
    if (state is GetProfileDataLoadingState) {
      return HandleWidgetState.buildLoadingWidget(context);
    } else if (state is GetProfileDataFailuresState) {
      return HandleWidgetState.buildErrorWidget(
        context: context,
        errorModel: state.errorModel,
        onPressed: () => profileViewModel.doAction(GetProfileDataAction()),
      );
    }
    return const ProfileBodyWidget();
  }

  void _navigateTOChangePassword() {
    Navigator.pushNamed(context, PageRouteName.changePassword);
  }
}
