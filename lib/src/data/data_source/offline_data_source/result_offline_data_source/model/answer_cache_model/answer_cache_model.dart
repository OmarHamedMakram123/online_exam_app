import 'package:hive/hive.dart';
part 'answer_cache_model.g.dart';
@HiveType(typeId: 3)
class CheckAnswerCachedModel {
  CheckAnswerCachedModel({
    this.questionId,
    this.correct,
    this.currentIndexOptionSelection
  });

  @HiveField(1)
  String? questionId;
  @HiveField(2)
  String? correct;
  @HiveField(3)
  int ? currentIndexOptionSelection;

}