import 'package:online_exam_app/src/data/mappers/question_mapper.dart';
import 'package:online_exam_app/src/data/model/response/question_response_model/question_response_model.dart';
import 'package:test/test.dart';

/*
*   List<QuestionEntity> toListQuestionEntity(
      QuestionResponseModel questionResponseModel) {
    if (questionResponseModel.questions == null) return [];
    List<QuestionEntity> questions = questionResponseModel.questions!
        .map(
          (questions) => _toQuestion(questions),
        )
        .toList();
    return questions;
  }
* */
void main() {
  QuestionMapper questionMapper=QuestionMapperImpl();
  test('should return empty List QuestionEntity when call questionMapper.toQuestionEntity is QuestionEmpty', () {
    QuestionResponseModel questionResponseModel =QuestionResponseModel();
   var actual= questionMapper.toListQuestionEntity(questionResponseModel);
   expect(actual, []);
  });
  test('should return  ListQuestionEntity when call questionMapper.toQuestionEntity is NotQuestion', () {
    QuestionResponseModel questionResponseModel =QuestionResponseModel(
      questions: [
       Questions(Id: "omar")
      ]
    );
    var actual= questionMapper.toListQuestionEntity(questionResponseModel);
    expect(actual[0].questionId, "omar" );
  });


}