import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/domain/entities/subject_entity.dart';
import 'package:online_exam_app/src/domain/use_case/get_all_subject_use_case.dart';
import 'package:online_exam_app/src/presentation/subject/view_modekl/subject_action.dart';
import 'package:online_exam_app/src/presentation/subject/view_modekl/subject_cubit.dart';
import 'package:test/test.dart';

import 'subject_cubit_test.mocks.dart';
@GenerateMocks([GetAllSubjectUseCase])
void main() {
 late GetAllSubjectUseCase getAllSubjectUseCase;
 late SubjectCubit subjectCubit;
 setUp(() {
   getAllSubjectUseCase=MockGetAllSubjectUseCase();
   subjectCubit=SubjectCubit(getAllSubjectUseCase);
 },);
  group("Test Subject Cubit",
      () {
    blocTest<SubjectCubit, SubjectState>(
     'should return emits[GetAllSubjectLoadingState , GetAllSubjectSuccessState] when call doAction(GetAllSubjectAction)is Successfully',
     build: () {
      var mockedResult=Success<List<SubjectEntity>>(date: []);
      provideDummy<ApiResult<List<SubjectEntity>>>(mockedResult);
      when(getAllSubjectUseCase.invoke()).thenAnswer((realInvocation) async=> mockedResult,);
      return subjectCubit;
       },
     act: (bloc) async{
     return await subjectCubit.doAction(GetAllSubjectAction());
     },
     expect: () => <TypeMatcher<SubjectState>>[
       isA<GetAllSubjectLoadingState>(),
       isA<GetAllSubjectSuccessState>(),
     ],
   );

    blocTest<SubjectCubit, SubjectState>(
      'should return emits[GetAllSubjectLoadingState , GetAllSubjectErrorState] when call doAction(GetAllSubjectAction)is Failures',
      build: () {
        var mockedResult=Failures<List<SubjectEntity>>(exception:Exception());
        provideDummy<ApiResult<List<SubjectEntity>>>(mockedResult);
        when(getAllSubjectUseCase.invoke()).thenAnswer((realInvocation) async=>mockedResult ,);
        return subjectCubit;
      },
      act: (bloc) async{
        return await subjectCubit.doAction(GetAllSubjectAction());
      },
      expect: () => <TypeMatcher<SubjectState>>[
        isA<GetAllSubjectLoadingState>(),
        isA<GetAllSubjectFailuresState>(),
      ],
    );
      },);
}