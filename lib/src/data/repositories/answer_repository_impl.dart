import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/core/api/common/excute_api_method.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/answer_data_source/answer_online_data_source.dart';
import 'package:online_exam_app/src/data/mappers/answer_mapper.dart';
import 'package:online_exam_app/src/data/model/request/check_answer_request.dart';
import 'package:online_exam_app/src/domain/entities/check_question_entity.dart';
import 'package:online_exam_app/src/domain/repositories/answer_repository.dart';

@Injectable(as: AnswerRepository)
class AnswerRepositoryImpl implements AnswerRepository{
  final AnswerOnlineDataSource answerOnlineDataSource;
  final AnswerMapper answerMapper;

  AnswerRepositoryImpl({required this.answerOnlineDataSource, required this.answerMapper});

  @override
  Future<ApiResult<CheckQuestionEntity>> checkAnswer({required CheckAnswerRequest checkAnswerRequest})async {
   return executeApi<CheckQuestionEntity>(apiCall: () async{
     var checkAnswerResponseModel= await answerOnlineDataSource.checkAnswerQuestion(checkAnswerRequest: checkAnswerRequest);
     return answerMapper.toCheckQuestion(checkAnswerResponseModel);
   },);
  }
}