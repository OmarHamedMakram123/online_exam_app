import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';
import 'package:online_exam_app/src/domain/use_case/get_exam_on_subject_use_case.dart';
import 'package:online_exam_app/src/presentation/exam/view_model/exam_action.dart';
import 'package:online_exam_app/src/presentation/exam/view_model/exam_cubit.dart';
import 'package:test/test.dart';

import 'exam_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetExamOnSubjectUseCase>(),])
void main() {
 late GetExamOnSubjectUseCase getExamOnSubjectUseCase;
   late ExamCubit examCubit;
  setUp(() {
    getExamOnSubjectUseCase= getExamOnSubjectUseCase=MockGetExamOnSubjectUseCase();
    examCubit=ExamCubit(getExamOnSubjectUseCase);
  },);
  group('Test Exam Cubit  method doAction', () {
   blocTest<ExamCubit,ExamState>(
       "should return emit[GetAllExamOnSubjectLoadingState , GetAllExamOnSubjectSuccessState when call doAction GetAllExamOnSubjectByIdAction] is Successfully",
       build: () {
         var mockedResult=Success<List<ExamEntity>>(date: []);
         provideDummy<ApiResult<List<ExamEntity>>>(mockedResult);
         when(getExamOnSubjectUseCase.invoke(subjectId: "subjectId")).thenAnswer((realInvocation)async =>mockedResult,);
         return examCubit;
       },
    act: (bloc) async {
         return await examCubit.doAction(GetAllExamOnSubjectByIdAction(subjectId: "subjectId"));
    },
     expect: () => <TypeMatcher<ExamState>>[
         isA<GetExamOnSubjectLoadingState>(),
          isA<GetExamOnSubjectSuccessState>(),
     ],
   );

   blocTest<ExamCubit,ExamState>(
     "should return emit[GetAllExamOnSubjectLoadingState , GetAllExamOnSubjectErrorState when call doAction GetAllExamOnSubjectByIdAction] is failures",
     build: () {
       var mockedResult=Failures<List<ExamEntity>>(exception: Exception());
       provideDummy<ApiResult<List<ExamEntity>>>(mockedResult);
       when(getExamOnSubjectUseCase.invoke(subjectId: "subjectId")).thenAnswer((realInvocation)async =>mockedResult,);
       return examCubit;
     },
     act: (bloc) async {
       return await examCubit.doAction(GetAllExamOnSubjectByIdAction(subjectId: "subjectId"));
     },     expect: () => <TypeMatcher<ExamState>>[
       isA<GetExamOnSubjectLoadingState>(),
       isA<GetExamOnSubjectErrorState>(),
     ],
   );


  });
}