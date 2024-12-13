
sealed class ExamAction {}
class GetAllExamOnSubjectByIdAction extends ExamAction {
  final String subjectId;
  GetAllExamOnSubjectByIdAction({required this.subjectId});
}
