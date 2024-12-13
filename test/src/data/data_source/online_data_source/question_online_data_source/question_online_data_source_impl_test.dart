import 'package:mockito/mockito.dart';
import 'package:online_exam_app/src/data/api/api_manger.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/question_online_data_source/question_online_data_source.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/question_online_data_source/question_online_data_source_impl.dart';
import 'package:online_exam_app/src/data/model/response/question_response_model/question_response_model.dart';
import 'package:test/test.dart';

import '../../../data_api/api_manger.mocks.dart';

/*
*  Future<QuestionResponseModel> getAllQuestionOnExamById({required String examId}) async{
     return await apiManger.getQuestionOnExamById(examId: examId);
  }
* */
void main() {
  ApiManger apiManger=MockApiManger();
  QuestionOnlineDataSource answerOnlineDataSource=QuestionOnlineDataSourceImpl(apiManger: apiManger);
  test('should return  checkAnswerQuestionModel  when call ApiManger.checkAnswerQuestion  ', ()async {
    QuestionResponseModel questionResponseModel=QuestionResponseModel();
    when(apiManger.getQuestionOnExamById(examId: "")).thenAnswer((realInvocation) async => questionResponseModel,);
    var actual= await answerOnlineDataSource.getAllQuestionOnExamById(examId: "");
    expect(actual, questionResponseModel);
  });
}