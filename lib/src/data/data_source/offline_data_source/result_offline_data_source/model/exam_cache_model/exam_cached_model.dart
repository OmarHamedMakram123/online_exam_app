import 'package:hive/hive.dart';
part 'exam_cached_model.g.dart';
@HiveType(typeId: 1)
class ExamCachedModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  num? duration;
  @HiveField(3)
  num? numberOfQuestions;
  @HiveField(4)
  String? createdAt;
  ExamCachedModel(
      {this.id,
        this.title,
        this.duration,
        this.createdAt,
        this.numberOfQuestions});
}
