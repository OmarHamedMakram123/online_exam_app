import 'answer_entity.dart';

class QuestionEntity{
  List<AnswerEntity> ? answer;
  String ? examId;
  num ? duration;
  String ? title;
  num ? numberOfQuestions;
  String ? questionId;
  String ? correct;

  QuestionEntity({
    this.examId,
    this.answer,
    this.duration,
    this.title,
    this.correct,
    this.questionId,
    this.numberOfQuestions,
});
}