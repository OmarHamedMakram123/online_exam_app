import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/question_online_data_source/question_online_data_source.dart';
import 'package:online_exam_app/src/data/mappers/question_mapper.dart';
import 'package:online_exam_app/src/data/model/response/question_response_model/question_response_model.dart';
import 'package:online_exam_app/src/data/repositories/question_repository_impl.dart';
import 'package:online_exam_app/src/domain/entities/question_entity.dart';
import 'package:online_exam_app/src/domain/repositories/question_repository.dart';
import 'package:test/test.dart';

import 'question_repository_imp;_test.mocks.dart';


@GenerateMocks([QuestionOnlineDataSource , QuestionMapper])
/*
*   Future<ApiResult<List<QuestionEntity>>> getAllQuestionOnExamById({required String examId});
*
* */
void main() {
  group('test Method getAllQuestionOnExamById', () {
    QuestionOnlineDataSource questionOnlineDataSource=MockQuestionOnlineDataSource();
    QuestionMapper questionMapper=MockQuestionMapper();
   QuestionRepository questionRepository=QuestionRepositoryImpl(questionOnlineDataSource: questionOnlineDataSource, questionMapper: questionMapper);
   QuestionResponseModel questionResponseModel=QuestionResponseModel();
     test("should return Success<QuestionEntity> when call examOnlineDataSource.getAllQuestionOnExamById and map QuestionEntity is successfully", ()async {
       QuestionEntity questionEntity=QuestionEntity();
       List<QuestionEntity>questions=[];
       when(questionOnlineDataSource.getAllQuestionOnExamById(examId: "")).thenAnswer((realInvocation) async => questionResponseModel ,);
       when(questionMapper.toListQuestionEntity(questionResponseModel)).thenReturn(questions);
       var mockedResult= Success<List<QuestionEntity>>(date: questions);
      provideDummy<ApiResult<List<QuestionEntity>>>(mockedResult);
      var actual=await  questionRepository.getAllQuestionOnExamById(examId: "");
      expect(actual, isA<Success<List<QuestionEntity>>>());
        },);

    test("should return Failures<QuestionEntity> when call examOnlineDataSource.getAllQuestionOnExamById and map QuestionEntity is Failures", ()async {
      QuestionEntity questionEntity=QuestionEntity();
      List<QuestionEntity>questions=[];
      when(questionOnlineDataSource.getAllQuestionOnExamById(examId: "")).thenThrow(Exception());
      when(questionMapper.toListQuestionEntity(questionResponseModel)).thenReturn(questions);
      var mockedResult= Success<List<QuestionEntity>>(date: questions);
      provideDummy<ApiResult<List<QuestionEntity>>>(mockedResult);
      var actual=await  questionRepository.getAllQuestionOnExamById(examId: "");
      expect(actual, isA<Failures<List<QuestionEntity>>>());
    },);

  });
     }

