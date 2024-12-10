import 'package:mockito/mockito.dart';
import 'package:online_exam_app/src/data/api/api_manger.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/subject_online_data_source/subject_online_data_source.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/subject_online_data_source/subject_online_data_source_impl.dart';
import 'package:online_exam_app/src/data/model/response/subject_response_model/subject_response_model.dart';
import 'package:test/test.dart';

import '../../../data_api/api_manger.mocks.dart';

void main() {
  late ApiManger apiManger;
  late SubjectOnlineDataSource subjectOnlineDataSource;
  setUp(() {
    apiManger=MockApiManger();
    subjectOnlineDataSource=SubjectOnlineDataSourceImpl(apiManger: apiManger);
  },);
  group("Subject Online Data Source ", () {
    test("should return subjectResponseModel when  call apiManger.getAllSubject",() async{
     SubjectResponseModel subjectResponseModel=SubjectResponseModel();
      when(apiManger.getAllSubject()).thenAnswer((realInvocation)async =>subjectResponseModel ,);
      var actual=await subjectOnlineDataSource.getAllSubject();
      expect(actual, subjectResponseModel);
    },);
  },);
}