import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/routes/page_route_name.dart';
import 'package:online_exam_app/core/utils/functions/handle_widget_state/handle_widget_state.dart';
import 'package:online_exam_app/dependency_injection/di.dart';
import 'package:online_exam_app/src/data/model/request/check_answer_request.dart';
import 'package:online_exam_app/src/domain/entities/check_question_entity.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';
import 'package:online_exam_app/src/presentation/exam_score_screen/view_model/exam_source_action.dart';
import 'package:online_exam_app/src/presentation/exam_score_screen/view_model/exam_source_cubit.dart';

import '../widget/exam_score_container.dart';

class ExamScoreScreenView extends StatefulWidget {
  const ExamScoreScreenView({super.key});

  @override
  State<ExamScoreScreenView> createState() => _ExamScoreScreenViewState();
}

class _ExamScoreScreenViewState extends State<ExamScoreScreenView> {
  var examSourceViewModel = getIt.get<ExamSourceCubit>();

  @override
  Widget build(BuildContext context) {
    final checkAnswerRequest =
        ModalRoute.of(context)!.settings.arguments as CheckAnswerRequest;
    return BlocProvider(
        create: (context) => examSourceViewModel..doAction(CheckAnswerQuestionButtonAction(checkAnswerRequest: checkAnswerRequest)),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Exam Source"),
            leading: IconButton(
              onPressed: () => examSourceViewModel.doAction(NavigateToStartExamAction()),
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
          body: BlocListener<ExamSourceCubit, ExamSourceState>(
            listener: (context, state) => _handleBlocListenerAnswerCubit(state,checkAnswerRequest.examEntity),
            child: BlocBuilder<ExamSourceCubit, ExamSourceState>(
                builder: (context, state) =>
                    _handleBlocBuilderAnswerCubit(state)),
          ),
        ));
  }

  Widget _handleBlocBuilderAnswerCubit(ExamSourceState examSourceState) {
    if (examSourceState is CheckAnswerQuestionLoadingState) {
      return HandleWidgetState.buildLoadingWidget(context);
    } else if (examSourceState is CheckAnswerQuestionFailuresState) {
      return HandleWidgetState.buildErrorWidget(
          context: context, errorModel: examSourceState.errorModel);
    } else {
      final checkAnswerEntity = examSourceViewModel.checkQuestionEntity;
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ExamScoreContainer(
          checkQuestions: CheckQuestionEntity(
              correct: checkAnswerEntity.correct,
              message: checkAnswerEntity.message,
              total: checkAnswerEntity.total,
              wrong: checkAnswerEntity.wrong),
        ),
      );
    }
  }

  void _handleBlocListenerAnswerCubit(ExamSourceState examSourceState,ExamEntity examEntity) {
    if (examSourceState is NavigateToStartExamScreenState) {
      _goNextToStartExam(examEntity:examEntity);
    }
  }

  void _goNextToStartExam({required ExamEntity examEntity}) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      PageRouteName.questionsScreen,
      (route) => false,
      arguments:examEntity
    );
  }
}
