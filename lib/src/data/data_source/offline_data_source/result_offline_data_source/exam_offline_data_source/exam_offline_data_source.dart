import 'package:hive/hive.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/result_offline_data_source/model/exam_cache_model/exam_cached_model.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/result_offline_data_source/model/question/cache_model/question_cache_model.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';
import 'package:online_exam_app/src/domain/entities/question_entity.dart';

import '../../../../../domain/entities/answer_entity.dart';
import '../../../../model/request/check_answer_request.dart';
import '../model/answer_cache_model/answer_cache_model.dart';

class CachedOfflineDataSource {
  static const String examCachedKey = "ExamCachedKey";
  static Future<void> cachedExamById({required ExamEntity examEntity}) async {
    var cachedExam = Hive.box<ExamCachedModel>(examCachedKey);
    cachedExam
        .add(ExamCachedModel(
            id: examEntity.id,
            createdAt: examEntity.createdAt,
            numberOfQuestions: examEntity.numberOfQuestions,
            duration: examEntity.duration,
            title: examEntity.title))
        .then(
      (value) {
        print("Add SuccessFully Exam");
      },
    ).catchError((error) {
      print("Not  SuccessFully Exam");
    });
  }

  static Future<List<ExamEntity>> getCachedExamList() async {
    var cachedExam = Hive.box<ExamCachedModel>(examCachedKey);
    List<ExamCachedModel> cachedExams = cachedExam.values.toList();
    List<ExamEntity> examsEntity = cachedExams
        .map(
          (e) => ExamEntity(
              title: e.title,
              duration: e.duration,
              numberOfQuestions: e.numberOfQuestions,
              createdAt: e.createdAt,
              id: e.id),
        )
        .toList();
    return examsEntity;
  }

  static const String questionCachedKey = "questionCachedKey";
  static Future<void> cachedQuestionById(
      {required List<QuestionEntity> questionEntity}) async {
    var questionBox = Hive.box<QuestionCacheModel>(questionCachedKey);
    questionBox.addAll(questionEntity.map(
      (e) {
        return QuestionCacheModel(
            title: e.title,
            numberOfQuestions: e.numberOfQuestions,
            duration: e.duration,
            answer: e.answer
                ?.map(
                  (e) => AnswerCachedModel(key: e.key, answer: e.answer),
                )
                .toList(),
            examId: e.examId,
            questionId: e.questionId);
      },
    )).then(
      (value) {
        print("Add is Successfully");
      },
    ).catchError((error) {
      print("Error  is $error");
    });
  }

  static Future<List<QuestionEntity>> getCachedQuestion() async {
    var questionBox = Hive.box<QuestionCacheModel>(questionCachedKey);
    List<QuestionCacheModel> questionsCached = questionBox.values.toList();
    List<QuestionEntity> questions = questionsCached
        .map(
          (e) => QuestionEntity(
              answer: e.answer
                  ?.map(
                    (e) => AnswerEntity(answer: e.answer, key: e.key),
                  )
                  .toList(),
              questionId: e.questionId,
              examId: e.examId,
              duration: e.duration,
              numberOfQuestions: e.numberOfQuestions,
              title: e.title),
        )
        .toList();

    return questions;
  }

  static const String answerCachedKey = "answerCachedKey";
  static Future<void> cachedListAnswer({required List<Answers> answers}) async {
    var box = Hive.box<CheckAnswerCachedModel>(answerCachedKey);
    box
        .addAll(answers
            .map(
              (e) => CheckAnswerCachedModel(
                  correct: e.correct,
                  questionId: e.questionId,
                  currentIndexOptionSelection: e.currentIndexOptionSelection),
            )
            .toList())
        .then(
      (value) {
        print("Add Successfully");
      },
    ).catchError((error) {
      print("Add Failures");
    });
  }

  static List<Answers> getCachedAnswerList() {
    var answersBox = Hive.box<CheckAnswerCachedModel>(answerCachedKey);
    List<CheckAnswerCachedModel> answers = answersBox.values.toList();
    return answers
        .map(
          (e) => Answers(
              correct: e.correct,
              currentIndexOptionSelection: e.currentIndexOptionSelection,
              questionId: e.questionId),
        )
        .toList();
  }
}
