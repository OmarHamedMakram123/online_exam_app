import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/core/api/common/excute_api_method.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/question_online_data_source/question_online_data_source.dart';
import 'package:online_exam_app/src/data/mappers/question_mapper.dart';
import 'package:online_exam_app/src/domain/entities/question_entity.dart';

import '../../domain/repositories/question_repository.dart';

@Injectable(as: QuestionRepository)
class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionOnlineDataSource questionOnlineDataSource;
  final QuestionMapper questionMapper;
  QuestionRepositoryImpl(
      {required this.questionOnlineDataSource, required this.questionMapper});
  @override
  Future<ApiResult<List<QuestionEntity>>> getAllQuestionOnExamById(
      {
        required String examId}) async {
    return executeApi<List<QuestionEntity>>(
      apiCall: () async {
        var questionResponseModel = await questionOnlineDataSource
            .getAllQuestionOnExamById(examId: examId);
        return questionMapper.toListQuestionEntity(questionResponseModel);
      },
    );
  }
}
