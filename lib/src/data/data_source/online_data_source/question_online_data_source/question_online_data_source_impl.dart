import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/data/api/api_manger.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/question_online_data_source/question_online_data_source.dart';
import 'package:online_exam_app/src/data/model/response/question_response_model/question_response_model.dart';

@Injectable(as: QuestionOnlineDataSource)
class QuestionOnlineDataSourceImpl implements QuestionOnlineDataSource {
  final ApiManger apiManger;
  QuestionOnlineDataSourceImpl({required this.apiManger});
  @override
  Future<QuestionResponseModel> getAllQuestionOnExamById({required String examId}) async{
     return await apiManger.getQuestionOnExamById(examId: examId);
  }
}