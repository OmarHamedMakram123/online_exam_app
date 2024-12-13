import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/data/api/api_manger.dart';
import 'package:online_exam_app/src/data/model/request/check_answer_request.dart';
import '../../../model/response/check_answer_model/check_answer_question_model.dart';
import 'answer_online_data_source.dart';

@Injectable(as:AnswerOnlineDataSource )
class AnswerOnlineDataSourceImpl implements AnswerOnlineDataSource{
  final ApiManger apiManger;
  AnswerOnlineDataSourceImpl({required this.apiManger});
  @override
  Future<CheckAnswerQuestionModel> checkAnswerQuestion({required CheckAnswerRequest checkAnswerRequest}) async{
   return await apiManger.checkAnswerQuestion( checkAnswerRequest);
  }
}