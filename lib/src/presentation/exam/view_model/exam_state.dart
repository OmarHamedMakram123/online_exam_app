part of 'exam_cubit.dart';

sealed class ExamState {}

class GetExamOnSubjectInitial extends ExamState {}
class GetExamOnSubjectLoadingState extends ExamState {}
class GetExamOnSubjectSuccessState extends ExamState {
  final List<ExamEntity>exams;
  GetExamOnSubjectSuccessState({required this.exams});
}
class GetExamOnSubjectErrorState extends ExamState {
final  ErrorModel errorModel;
GetExamOnSubjectErrorState({required this.errorModel});
}
