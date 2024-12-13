import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/exam_online_data_source/exam_online_data_source.dart';
import 'package:online_exam_app/src/data/mappers/exam_mapper.dart';
import 'package:online_exam_app/src/data/model/response/exam_response_model/exam_response_model.dart';
import 'package:online_exam_app/src/data/repositories/exam_repository_impl.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';
import 'package:test/test.dart';
import 'exam_repository_imol_test.mocks.dart';


@GenerateMocks([ExamOnlineDataSource , ExamMapper])
void main() {
  group('test Method getExamOnSubject', () {
   ExamOnlineDataSource examOnlineDataSource=MockExamOnlineDataSource();
   ExamMapper examMapper=MockExamMapper();
   ExamRepositoryImpl examRepository=ExamRepositoryImpl(examOnlineDataSource: examOnlineDataSource, examMapper: examMapper);
   test("should return Success<ListExamEntity> when call examOnlineDataSource.getExamOnSubject and map examEntity is successfully", ()async {
    ExamResponseModel examResponseModel=ExamResponseModel();
    List<ExamEntity>examEntity=[];
    var mockedResult=Success<List<ExamEntity>>(date: []);
    provideDummy<ApiResult<List<ExamEntity>>>(mockedResult);
    String subjectId="";
     when(examOnlineDataSource.getExamOnSubjectId(subjectId: subjectId)).thenAnswer((realInvocation)async =>examResponseModel ,);
     when(examMapper.toExamEntity(examResponseModel)).thenReturn(examEntity);
     var actual= await examRepository.getExamOnSubject(subjectId: subjectId);
     expect(actual, isA<Success<List<ExamEntity>>>());
   },);
   test("should return Failures<ListExamEntity> when call examOnlineDataSource.getExamOnSubject and map examEntity is failures", ()async {
     ExamResponseModel examResponseModel=ExamResponseModel();
     List<ExamEntity>examEntity=[];
     var mockedResult=Success<List<ExamEntity>>(date: []);
     provideDummy<ApiResult<List<ExamEntity>>>(mockedResult);
     String subjectId="";
     when(examOnlineDataSource.getExamOnSubjectId(subjectId: subjectId)).thenThrow(DioException(requestOptions: RequestOptions()));
     when(examMapper.toExamEntity(examResponseModel)).thenReturn(examEntity);
     var actual= await examRepository.getExamOnSubject(subjectId: subjectId);
     expect(actual, isA<Failures<List<ExamEntity>>>());
   },);
  });


}