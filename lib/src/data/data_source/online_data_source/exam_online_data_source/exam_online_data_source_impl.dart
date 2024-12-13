import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/data/api/api_manger.dart';
import 'package:online_exam_app/src/data/model/response/exam_response_model/exam_response_model.dart';

import 'exam_online_data_source.dart';
@Injectable(as:ExamOnlineDataSource )
class ExamOnlineDataSourceImpl implements ExamOnlineDataSource{
  final ApiManger apiManger;
  ExamOnlineDataSourceImpl({required this.apiManger});
  @override
  Future<ExamResponseModel> getExamOnSubjectId({required String subjectId}) async{
    return  await apiManger.getExamOnSubjectId(subjectId: subjectId);
  }
}