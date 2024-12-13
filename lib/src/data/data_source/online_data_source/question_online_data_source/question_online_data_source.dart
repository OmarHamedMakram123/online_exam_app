import '../../../model/response/question_response_model/question_response_model.dart';

abstract class QuestionOnlineDataSource{
  Future<QuestionResponseModel>getAllQuestionOnExamById({required String examId});
}