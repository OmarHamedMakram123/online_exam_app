import 'package:online_exam_app/src/data/model/request/check_answer_request.dart';

import '../../../core/api/common/api_result.dart';
import '../entities/check_question_entity.dart';

abstract class AnswerRepository{
  Future<ApiResult<CheckQuestionEntity>> checkAnswer({
    required CheckAnswerRequest checkAnswerRequest
});
}