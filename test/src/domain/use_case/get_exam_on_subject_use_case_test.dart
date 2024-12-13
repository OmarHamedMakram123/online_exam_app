import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';
import 'package:online_exam_app/src/domain/repositories/exam_repository.dart';
import 'package:online_exam_app/src/domain/use_case/get_exam_on_subject_use_case.dart';
import 'package:test/test.dart';

import 'mocked/moked_repository.mocks.dart';

void main() {
  test('should return Success<List<ExamEntity>>when call examRepository.getExamOnSubjectById is success', () async{
   ExamRepository examRepository=MockExamRepository();
   GetExamOnSubjectUseCase getExamOnSubjectUseCase=GetExamOnSubjectUseCase(examRepository: examRepository);
   var mockedResult=Success<List<ExamEntity>>(date: []);
   provideDummy<ApiResult<List<ExamEntity>>>(mockedResult);
   String subjectId ="";
   when(examRepository.getExamOnSubject(subjectId: subjectId)).thenAnswer((realInvocation)async =>mockedResult ,);
   var actual=await getExamOnSubjectUseCase.invoke(subjectId: subjectId);
   expect(actual, isA<Success<List<ExamEntity>>>());
  });
}