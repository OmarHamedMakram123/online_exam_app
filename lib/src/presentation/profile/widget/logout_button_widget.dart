import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/extension/extension.dart';
import 'package:online_exam_app/core/utils/dialogs/loading_dialog.dart';
import 'package:online_exam_app/dependency_injection/di.dart';
import 'package:online_exam_app/src/presentation/profile/view_mdoel/profile_action.dart';
import 'package:online_exam_app/src/presentation/profile/view_mdoel/profile_cubit.dart';

import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../core/utils/widget/custom_button_widget.dart';

class LogoutButtonWidget extends StatefulWidget {
  const LogoutButtonWidget({super.key});

  @override
  State<LogoutButtonWidget> createState() => _LogoutButtonWidgetState();
}

class _LogoutButtonWidgetState extends State<LogoutButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      text: "Logout",
      textColor: Colors.white,
      color: AppColors.kRed,
      onPressed: () => _dialogLogOut(),
    );
  }

  void _dialogLogOut() {
    showAwesomeDialog(context,
        title: "Logout",
        desc: "logoOut", //.of(context)!.confirmLogout,
        onOk: () => BlocProvider.of<ProfileCubit>(context)
            .doAction(LogoutButtonAction()),
        dialogType: DialogType.warning,
        onCancel: () => LoadingDialog.hide(context));
  }
}
