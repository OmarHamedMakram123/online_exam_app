import 'package:mockito/mockito.dart';
import 'package:online_exam_app/src/data/api/api_manger.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/answer_data_source/answer_online_data_source.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/answer_data_source/answer_online_data_source_impl.dart';
import 'package:online_exam_app/src/data/model/request/check_answer_request.dart';
import 'package:online_exam_app/src/data/model/response/check_answer_model/check_answer_question_model.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';
import 'package:test/test.dart';

import '../../../data_api/api_manger.mocks.dart';



/*
*   @override
  Future<CheckAnswerQuestionModel> checkAnswerQuestion({required CheckAnswerRequest checkAnswerRequest}) async{
   return await apiManger.checkAnswerQuestion( checkAnswerRequest);
  }
* */
void main() {
  ApiManger apiManger=MockApiManger();
   AnswerOnlineDataSource answerOnlineDataSource=AnswerOnlineDataSourceImpl(apiManger: apiManger);
  test('should return  checkAnswerQuestionModel  when call ApiManger.checkAnswerQuestion  ', ()async {
   var checkAnswerRequest=CheckAnswerRequest(examEntity: ExamEntity());
   CheckAnswerQuestionModel checkAnswerQuestionModel=CheckAnswerQuestionModel();
   when(apiManger.checkAnswerQuestion(checkAnswerRequest)).thenAnswer((realInvocation) async => checkAnswerQuestionModel,);
   var actual= await answerOnlineDataSource.checkAnswerQuestion(checkAnswerRequest: checkAnswerRequest);
   expect(actual, checkAnswerQuestionModel);
  });
}