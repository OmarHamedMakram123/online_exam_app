import '../../../model/request/check_answer_request.dart';
import '../../../model/response/check_answer_model/check_answer_question_model.dart';

abstract class AnswerOnlineDataSource{
  Future<CheckAnswerQuestionModel>checkAnswerQuestion({required CheckAnswerRequest checkAnswerRequest});
}
