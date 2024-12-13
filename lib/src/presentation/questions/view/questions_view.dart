import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/config/routes/page_route_name.dart';
import 'package:online_exam_app/core/utils/functions/handle_widget_state/handle_widget_state.dart';
import 'package:online_exam_app/dependency_injection/di.dart';
import 'package:online_exam_app/src/presentation/questions/view_model/questions_cubit.dart';
import 'package:online_exam_app/src/presentation/questions/view_model/timer/timer_cubit.dart';
import '../../../data/data_source/offline_data_source/result_offline_data_source/exam_offline_data_source/exam_offline_data_source.dart';
import '../../../data/model/request/check_answer_request.dart';
import '../../../domain/entities/exam_entity.dart';
import '../widget/question_body_widget.dart';
import '../widget/timer_widget.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  var questionViewModel = getIt.get<QuestionsCubit>();
  var timerViewModel = getIt.get<TimerCubit>();
  @override
  Widget build(BuildContext context) {
    questionViewModel.examEntity = ModalRoute.of(context)!.settings.arguments as ExamEntity;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => questionViewModel
            ..getAllQuestionOnExamById(
                examId:questionViewModel.examEntity.id ?? "670070a830a3c3c1944a9c63"),
        ),
        BlocProvider(
          create: (context) => timerViewModel,
        ),
      ],
      child: Scaffold(
        appBar: buildAppBar(questionViewModel.examEntity),
        body: BlocConsumer<QuestionsCubit, QuestionsState>(
          listener: (context, state) => _handleBlocListenerQuestionCubit(state),
          builder: (context, state) {
            return _handleBlocBuilderQuestionCubit(state);
          },
        ),
      ),
    );
  }

  Widget _handleBlocBuilderQuestionCubit(QuestionsState state) {
    if (state is GetAllQuestionOnExamByIdLoadingState) {
      return HandleWidgetState.buildLoadingWidget(context);
    } else if (state is GetAllQuestionOnExamByIdFailuresState) {
      return HandleWidgetState.buildErrorWidget(
          context: context, errorModel: state.errorModel);
    }else{
      return HandleWidgetState.buildCheckListEmptyWidget(
          list: questionViewModel.questions, widget: const QuestionBodyWidget());
    }

  }

  void _handleBlocListenerQuestionCubit(QuestionsState state) async{
    if (state is NavigateToExamSourceScreen) {
      timerViewModel.close();
     await  CachedOfflineDataSource.cachedListAnswer(answers: questionViewModel.answer);
      _navigateToExamSourceScreen();
    }
  }

  AppBar buildAppBar(ExamEntity examEntity) {
    return AppBar(
      title: Text(examEntity.title ?? "Exam "),
      actions: [
        TimerWidgetAction(duration: examEntity.duration?.toInt() ?? 25),
      ],
    );
  }

  void _navigateToExamSourceScreen() {
    Navigator.pushNamed(
      context,
      PageRouteName.examScoreScreen,
      arguments: CheckAnswerRequest(
          answers: questionViewModel.answer,
          time: timerViewModel.remainingTime,
          examEntity: questionViewModel.examEntity
      ),
    );
  }
}
