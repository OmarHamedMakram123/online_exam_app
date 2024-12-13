import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/data/model/response/question_response_model/question_response_model.dart';
import 'package:online_exam_app/src/domain/entities/answer_entity.dart';
import 'package:online_exam_app/src/domain/entities/question_entity.dart';

abstract class QuestionMapper {
  List<QuestionEntity> toListQuestionEntity(
      QuestionResponseModel questionResponseModel);
}

@Injectable(as: QuestionMapper)
class QuestionMapperImpl implements QuestionMapper {
  @override
  List<QuestionEntity> toListQuestionEntity(
      QuestionResponseModel questionResponseModel) {
    if (questionResponseModel.questions == null) return [];
    List<QuestionEntity> questions = questionResponseModel.questions!
        .map(
          (questions) => _toQuestion(questions),
        )
        .toList();
    return questions;
  }


  QuestionEntity _toQuestion(Questions question) {
    return QuestionEntity(
        answer: _toListAnswersEntity(question.answers ?? []),
        examId: question.exam?.Id,
        questionId: question.Id,
        numberOfQuestions: question.exam?.numberOfQuestions,
        duration: question.exam?.duration,
        title: question.question,
      correct: question.correct
    );
  }
  List<AnswerEntity> _toListAnswersEntity(List<Answers> answers) {
    return answers
        .map(
          (answer) => _toAnswerEntity(answer),
        )
        .toList();
  }
  AnswerEntity _toAnswerEntity(Answers answer) {
    return AnswerEntity(answer: answer.answer, key: answer.key);
  }
}
