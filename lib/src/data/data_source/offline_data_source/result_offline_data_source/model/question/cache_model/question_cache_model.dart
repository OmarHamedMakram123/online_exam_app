
import 'package:hive/hive.dart';

part 'question_cache_model.g.dart';
@HiveType(typeId: 2)
class QuestionCacheModel{
  @HiveField(1)
  List<AnswerCachedModel> ? answer;
  @HiveField(2)
  String ? examId;
  @HiveField(3)
  num ? duration;
  @HiveField(4)
  String ? title;
  @HiveField(5)
  num ? numberOfQuestions;
  @HiveField(6)
  String ? questionId;

  QuestionCacheModel({
    this.examId,
    this.answer,
    this.duration,
    this.title,
    this.questionId,
    this.numberOfQuestions,
  });
}

@HiveType(typeId: 3)
class AnswerCachedModel{
  @HiveField(1)
  String ? answer;
  @HiveField(2)
  String ? key;
  AnswerCachedModel({this.key,this.answer});
}

