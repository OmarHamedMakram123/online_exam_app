import '../../../model/response/exam_response_model/exam_response_model.dart';

abstract class ExamOnlineDataSource{
  Future<ExamResponseModel>getExamOnSubjectId({required String subjectId});
}