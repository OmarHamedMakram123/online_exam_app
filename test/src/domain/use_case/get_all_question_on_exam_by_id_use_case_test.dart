import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/response/question_response_model/question_response_model.dart';
import 'package:online_exam_app/src/domain/entities/question_entity.dart';
import 'package:online_exam_app/src/domain/repositories/question_repository.dart';
import 'package:online_exam_app/src/domain/use_case/get_all_question_on_exam_by_id_use_case.dart';
import 'package:test/test.dart';

import 'mocked/moked_repository.mocks.dart';

void main() {
  test('should return ApiResult<List<QuestionEntity> when call questionRepository.getAllQuestionOnSubjectById', () async{
    QuestionRepository questionRepository=MockQuestionRepository();
    GetAllQuestionOnExamByIdUseCase getAllQuestionOnExamByIdUseCase=GetAllQuestionOnExamByIdUseCase(questionRepository: questionRepository);
    var mockedResult=Success<List<QuestionEntity>>(date: []);
    provideDummy<ApiResult<List<QuestionEntity>>>(mockedResult);
    when(questionRepository.getAllQuestionOnExamById(examId: "")).thenAnswer((realInvocation) async => mockedResult,);
    var actual=await getAllQuestionOnExamByIdUseCase.invoke(examId: "");
    expect(actual, isA<Success<List<QuestionEntity>>>());
  });
}