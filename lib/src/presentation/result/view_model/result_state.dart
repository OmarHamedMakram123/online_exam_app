part of 'result_cubit.dart';

@immutable
sealed class ResultState {}

final class ResultInitial extends ResultState {}

class GetExamsQuestionLoadingState extends ResultState{}
class GetExamsQuestionSuccessState extends ResultState{}
class GetExamsQuestionFailuresState extends ResultState{}
