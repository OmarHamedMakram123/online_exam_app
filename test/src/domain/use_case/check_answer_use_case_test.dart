import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/request/check_answer_request.dart';
import 'package:online_exam_app/src/domain/entities/check_question_entity.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';
import 'package:online_exam_app/src/domain/repositories/answer_repository.dart';
import 'package:online_exam_app/src/domain/use_case/check_answer_use_case.dart';
import 'package:test/test.dart';

import 'mocked/moked_repository.mocks.dart';

void main() {
  test('should return Success<CheckQuestionEntity> when call answerRepository.checkAnswerQuestion', () async{
    AnswerRepository answerRepository=MockAnswerRepository();
    CheckAnswerUseCase checkAnswerUseCase=CheckAnswerUseCase(answerRepository: answerRepository);
    CheckAnswerRequest checkAnswerRequest=CheckAnswerRequest(examEntity: ExamEntity());
    CheckQuestionEntity checkQuestionEntity=CheckQuestionEntity();
    var mockedResult=Success<CheckQuestionEntity>(date: checkQuestionEntity);
    provideDummy<ApiResult<CheckQuestionEntity>>(mockedResult);
    when(answerRepository.checkAnswer(checkAnswerRequest: checkAnswerRequest)).thenAnswer((realInvocation)async => mockedResult,);
    var actual=  await checkAnswerUseCase.invoke(checkAnswerRequest: checkAnswerRequest);
    expect(actual, isA<Success<CheckQuestionEntity>>());
  }
  );
}