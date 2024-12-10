import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/subject_online_data_source/subject_online_data_source.dart';
import 'package:online_exam_app/src/data/mappers/subject_mapper.dart';
import 'package:online_exam_app/src/data/model/response/subject_response_model/subject_response_model.dart';
import 'package:online_exam_app/src/data/repositories/subject_repository_impl.dart';
import 'package:online_exam_app/src/domain/entities/subject_entity.dart';
import 'package:online_exam_app/src/domain/repositories/subject_repository.dart';
import 'package:test/test.dart';

import 'subject_repository_impl_test.mocks.dart';

@GenerateMocks([SubjectOnlineDataSource,SubjectMapper])
void main() {
 late SubjectMapper subjectMapper;
late SubjectOnlineDataSource subjectOnlineDataSource;
late SubjectRepository subjectRepository;
setUp(() {
  subjectMapper=MockSubjectMapper();
   subjectOnlineDataSource=MockSubjectOnlineDataSource();
   subjectRepository=SubjectRepositoryImpl(subjectMapper, subjectOnlineDataSource: subjectOnlineDataSource);

   },);
  group("Test Subject Repository Impl", () {
    group("Test Get All Subject Method ", () {
      test("should return ListSubjectEntity when call subjectOnlineDataSource.getAllSubject  and map subjectEntity is successfully",() async{
      SubjectResponseModel subjectResponseModel=SubjectResponseModel();
      when(subjectOnlineDataSource.getAllSubject()).thenAnswer((realInvocation) async=>subjectResponseModel ,);
      when(subjectMapper.toSubjectEntity(subjectResponseModel)).thenReturn([]);
      var actual=await subjectRepository.getAllSubject();
      expect(actual, isA<Success<List<SubjectEntity>>>());
      },);
      test("should return exception when call subjectOnlineDataSource.getAllSubject  and map subjectEntity is successfully",() async{
        SubjectResponseModel subjectResponseModel=SubjectResponseModel();
        when(subjectOnlineDataSource.getAllSubject()).thenThrow(DioException(requestOptions: RequestOptions(),type: DioExceptionType.connectionError));
        when(subjectMapper.toSubjectEntity(subjectResponseModel)).thenReturn([]);
        var actual=await subjectRepository.getAllSubject();
        expect(actual, isA<Failures<List<SubjectEntity>>>());
      },);
    },);
 },);
}