import 'package:flutter/material.dart';
import 'package:online_exam_app/core/styles/colors/app_colors.dart';
import 'package:online_exam_app/core/utils/functions/handle_widget_state/handle_widget_state.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/result_offline_data_source/exam_offline_data_source/exam_offline_data_source.dart';
import 'package:online_exam_app/src/presentation/result/widget/question_result_list_widget.dart';
class ResultAnswerQuestionView extends StatelessWidget {
  const ResultAnswerQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kWhite,
        appBar: AppBar(
          title: const Text("Answers"),
        ),
        body: FutureBuilder(
          future: CachedOfflineDataSource.getCachedQuestion(),
          builder: (context, snapshot) {
            return HandleWidgetState.buildCheckListEmptyWidget(
                list: snapshot.data ?? [],
                widget: QuestionResultListWidget(
                  questions: snapshot.data ?? [],
                ));
          },
        ));
  }
}
