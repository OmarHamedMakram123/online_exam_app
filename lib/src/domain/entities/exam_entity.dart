class ExamEntity {
  String? id;
  String? title;
  num? duration;
  num? numberOfQuestions;
  String? createdAt;
  ExamEntity(
      {this.id,
      this.title,
      this.duration,
      this.createdAt,
      this.numberOfQuestions});
}
