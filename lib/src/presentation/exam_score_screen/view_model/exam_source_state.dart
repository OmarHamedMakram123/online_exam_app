part of 'exam_source_cubit.dart';

@immutable
sealed class ExamSourceState {}

final class ExamSourceInitial extends ExamSourceState {}

class CheckAnswerQuestionLoadingState extends ExamSourceState {}
class CheckAnswerQuestionSuccessState extends ExamSourceState {}
class CheckAnswerQuestionFailuresState extends ExamSourceState {
  final ErrorModel errorModel;
  CheckAnswerQuestionFailuresState({required this.errorModel});
}
class NavigateToStartExamScreenState extends ExamSourceState {}
