import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/domain/entities/subject_entity.dart';
import 'package:online_exam_app/src/domain/repositories/subject_repository.dart';
import 'package:online_exam_app/src/domain/use_case/get_all_subject_use_case.dart';
import 'mocked/moked_repository.mocks.dart';

void main() {
  test('should return ApiResult<List<UserEntity> when call subjectRepository.getAllSubject', () async{
   SubjectRepository subjectRepository=MockSubjectRepository();
   GetAllSubjectUseCase getAllSubjectUseCase=GetAllSubjectUseCase(subjectRepository: subjectRepository);
   var mockedResult=Success<List<SubjectEntity>>(date: []);
    provideDummy<ApiResult<List<SubjectEntity>>>(mockedResult);
   when(subjectRepository.getAllSubject()).thenAnswer((realInvocation) async => mockedResult,);
   var actual=await getAllSubjectUseCase.invoke();
    expect(actual, isA<Success<List<SubjectEntity>>>());
  });
}