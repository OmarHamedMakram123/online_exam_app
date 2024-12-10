part of 'subject_cubit.dart';

@immutable
sealed class SubjectState {}

final class SubjectInitial extends SubjectState {}
class GetAllSubjectLoadingState extends SubjectState{}
class GetAllSubjectSuccessState extends SubjectState{
  final List<SubjectEntity>subject;
  GetAllSubjectSuccessState({required this.subject});
}
class GetAllSubjectFailuresState extends SubjectState{
  final ErrorModel errorModel;
  GetAllSubjectFailuresState({required this.errorModel});
}