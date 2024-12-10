import '../../../model/response/subject_response_model/subject_response_model.dart';

abstract class SubjectOnlineDataSource{
  Future<SubjectResponseModel>getAllSubject();
}