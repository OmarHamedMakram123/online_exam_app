import 'package:mockito/mockito.dart';
import 'package:online_exam_app/src/data/api/api_manger.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/exam_online_data_source/exam_online_data_source.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/exam_online_data_source/exam_online_data_source_impl.dart';
import 'package:online_exam_app/src/data/model/response/exam_response_model/exam_response_model.dart';
import 'package:test/test.dart';

import '../../../data_api/api_manger.mocks.dart';

void main() {
  test('should return examResponseModel when call apiManger.getExamOnSubject BY id', () async{
   ApiManger apiManger=MockApiManger();
   String subjectId="subjectId";
   ExamOnlineDataSource examOnlineDataSource =ExamOnlineDataSourceImpl(apiManger: apiManger);
   ExamResponseModel examResponseModel=ExamResponseModel();
   when(apiManger.getExamOnSubjectId(subjectId: subjectId)).thenAnswer((realInvocation) async =>examResponseModel ,);
   var actual=  await examOnlineDataSource.getExamOnSubjectId(subjectId: subjectId);
   expect(actual, examResponseModel);
  });
}