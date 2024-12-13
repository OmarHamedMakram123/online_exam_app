part of 'questions_cubit.dart';

@immutable
sealed class QuestionsState {}

final class QuestionsInitial extends QuestionsState {}
class ChangeSelectedOptionsAnswerState extends QuestionsState{}
class ChangeCurrentQuestionIndexState extends QuestionsState{}
class NavigateToExamSourceScreen extends QuestionsState{}


class GetAllQuestionOnExamByIdLoadingState extends QuestionsState{}
class GetAllQuestionOnExamByIdSuccessState extends QuestionsState{}
class GetAllQuestionOnExamByIdFailuresState extends QuestionsState{
  final ErrorModel errorModel;
  GetAllQuestionOnExamByIdFailuresState({required this.errorModel});
}
