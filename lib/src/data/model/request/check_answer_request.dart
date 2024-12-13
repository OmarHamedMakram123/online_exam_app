import '../../../domain/entities/exam_entity.dart';

class CheckAnswerRequest {
  CheckAnswerRequest({
      this.answers, 
      this.time,
    required  this.examEntity
  });

  List<Answers>? answers;
  num? time;
  ExamEntity examEntity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    map['time'] = time;
    return map;
  }
}

class Answers {
  Answers({
    this.questionId,
    this.correct,
    this.currentIndexOptionSelection
  });

  String? questionId;
  String? correct;
  int ? currentIndexOptionSelection;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['questionId'] = questionId;
    map['correct'] = correct;
    return map;
  }

}