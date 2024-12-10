import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/data/api/api_manger.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/subject_online_data_source/subject_online_data_source.dart';
import 'package:online_exam_app/src/data/model/response/subject_response_model/subject_response_model.dart';

@Injectable(as: SubjectOnlineDataSource)
class SubjectOnlineDataSourceImpl implements SubjectOnlineDataSource{
  final ApiManger apiManger;
  SubjectOnlineDataSourceImpl({required this.apiManger});
  @override
  Future<SubjectResponseModel> getAllSubject() async{
    return await  apiManger.getAllSubject();
  }
}