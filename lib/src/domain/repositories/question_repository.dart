import 'package:online_exam_app/src/domain/entities/question_entity.dart';

import '../../../core/api/common/api_result.dart';

abstract class QuestionRepository{
  Future<ApiResult<List<QuestionEntity>>> getAllQuestionOnExamById({required String examId});
}