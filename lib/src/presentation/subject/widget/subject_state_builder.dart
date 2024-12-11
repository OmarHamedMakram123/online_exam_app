import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/presentation/subject/widget/subject_list_widget.dart';

import '../../../../core/utils/functions/handle_widget_state/handle_widget_state.dart';
import '../view_modekl/subject_action.dart';
import '../view_modekl/subject_cubit.dart';

class SubjectStateBuilder extends StatelessWidget {
  const SubjectStateBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var subjectViewModel = context.read<SubjectCubit>();
    return BlocBuilder<SubjectCubit, SubjectState>(
      builder: (context, state) {
        if (state is GetAllSubjectLoadingState) {
          return HandleWidgetState.buildLoadingWidget(context);
        } else if (state is GetAllSubjectFailuresState) {
          // وضع Expanded داخل Column أو إزالة Expanded
          return HandleWidgetState.buildErrorWidget(
            onPressed: () =>
                subjectViewModel.doAction(GetAllSubjectAction()),
            context: context,
            errorModel: state.errorModel,
          );
        } else {
          return HandleWidgetState.buildCheckListEmptyWidget(
            list: subjectViewModel.subject,
            widget: SubjectListWidget(subjects: subjectViewModel.subject),
          );
        }
      },
    );
  }
}
