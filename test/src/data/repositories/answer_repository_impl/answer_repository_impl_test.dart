import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/answer_data_source/answer_online_data_source.dart';
import 'package:online_exam_app/src/data/mappers/answer_mapper.dart';
import 'package:online_exam_app/src/data/model/request/check_answer_request.dart';
import 'package:online_exam_app/src/data/model/response/check_answer_model/check_answer_question_model.dart';
import 'package:online_exam_app/src/data/repositories/answer_repository_impl.dart';
import 'package:online_exam_app/src/domain/entities/check_question_entity.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';
import 'package:test/test.dart';

import 'answer_repository_impl_test.mocks.dart';


@GenerateMocks([AnswerOnlineDataSource,AnswerMapper])
void main() {
AnswerOnlineDataSource answerOnlineDataSource=MockAnswerOnlineDataSource();
AnswerMapper answerMapper=MockAnswerMapper();
AnswerRepositoryImpl answerRepositoryImpl=AnswerRepositoryImpl(answerOnlineDataSource: answerOnlineDataSource, answerMapper: answerMapper);
  group("Test Method  checkAnswer Repository", () {
    CheckAnswerQuestionModel checkAnswerQuestionModel=CheckAnswerQuestionModel();
    CheckAnswerRequest checkAnswerRequest=CheckAnswerRequest(examEntity: ExamEntity());
    CheckQuestionEntity checkQuestionEntity=CheckQuestionEntity();
    test("should return Success<List<CheckQuestionEntity> when call answerOnlineDataSource.checkAnswerQuestion and map CheckAnswerEntity is Successfully", ()async {
     var mockedResult=Success<CheckQuestionEntity>(date: checkQuestionEntity);
      provideDummy<ApiResult<CheckQuestionEntity>>(mockedResult);
      when(answerOnlineDataSource.checkAnswerQuestion(checkAnswerRequest: checkAnswerRequest)).thenAnswer((realInvocation) async => checkAnswerQuestionModel ,);
      when(answerMapper.toCheckQuestion(checkAnswerQuestionModel)).thenReturn(checkQuestionEntity);
      var actual=await answerRepositoryImpl.checkAnswer(checkAnswerRequest: checkAnswerRequest);
      expect(actual, isA<Success<CheckQuestionEntity>>());
    },);

    test("should return Failures<List<CheckQuestionEntity> when call answerOnlineDataSource.checkAnswerQuestion and map CheckAnswerEntity is Failures", ()async {
      var mockedResult=Failures<CheckQuestionEntity>(exception: Exception());
      provideDummy<ApiResult<CheckQuestionEntity>>(mockedResult);
      when(answerOnlineDataSource.checkAnswerQuestion(checkAnswerRequest: checkAnswerRequest)).thenThrow(Exception());
      when(answerMapper.toCheckQuestion(checkAnswerQuestionModel)).thenReturn(checkQuestionEntity);
      var actual=await answerRepositoryImpl.checkAnswer(checkAnswerRequest: checkAnswerRequest);
      expect(actual, isA<Failures<CheckQuestionEntity>>());
    },);
  },);
}