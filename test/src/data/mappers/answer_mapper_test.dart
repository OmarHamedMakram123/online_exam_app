import 'package:online_exam_app/src/data/mappers/answer_mapper.dart';
import 'package:online_exam_app/src/data/model/response/check_answer_model/check_answer_question_model.dart';
import 'package:test/test.dart';


/*
*   CheckQuestionEntity toCheckQuestion(
* CheckAnswerQuestionModel checkAnswer);

* */
void main() {
  AnswerMapper answerMapper=AnswerMapperImpl();
  test('should return checkQuestionEntity when call AnswerMapper.toCheckQuestion()  ', () {
    CheckAnswerQuestionModel checkAnswerQuestionModel=CheckAnswerQuestionModel(total: "100");
    var actual=answerMapper.toCheckQuestion(checkAnswerQuestionModel);
    expect(actual.total, "100");
  });
}