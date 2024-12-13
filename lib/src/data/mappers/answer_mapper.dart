import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/domain/entities/check_question_entity.dart';

import '../model/response/check_answer_model/check_answer_question_model.dart';

abstract class AnswerMapper{
  CheckQuestionEntity toCheckQuestion(CheckAnswerQuestionModel checkAnswer);
}

@Injectable(as: AnswerMapper)
class AnswerMapperImpl implements AnswerMapper{
  @override
  CheckQuestionEntity toCheckQuestion(CheckAnswerQuestionModel checkAnswer) {
   return CheckQuestionEntity(
     correct: checkAnswer.correct?.toInt() ?? 0,
     wrong: checkAnswer.wrong?.toInt() ?? 0,
     total: checkAnswer.total,
     message: checkAnswer.message,
   );
  }
}
