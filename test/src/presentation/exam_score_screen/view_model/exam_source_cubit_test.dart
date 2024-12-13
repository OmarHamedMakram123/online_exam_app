import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/src/data/model/request/check_answer_request.dart';
import 'package:online_exam_app/src/domain/entities/check_question_entity.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';
import 'package:online_exam_app/src/domain/use_case/check_answer_use_case.dart';
import 'package:online_exam_app/src/presentation/exam_score_screen/view_model/exam_source_action.dart';
import 'package:online_exam_app/src/presentation/exam_score_screen/view_model/exam_source_cubit.dart';
import 'package:test/test.dart';

import 'exam_source_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CheckAnswerUseCase>()])
void main() {
  late CheckAnswerUseCase checkAnswerUseCase;
  late ExamSourceCubit examSourceCubit;
  late CheckQuestionEntity checkQuestionEntity;
  late CheckAnswerRequest checkAnswerRequest;
  setUp(() {
    checkAnswerUseCase=MockCheckAnswerUseCase();
    examSourceCubit=ExamSourceCubit(checkAnswerUseCase);
    checkAnswerRequest=CheckAnswerRequest(examEntity: ExamEntity());
    checkQuestionEntity=CheckQuestionEntity();

  },);
  group("Test Exam Source Cubit  method do Action ", () {
    blocTest<ExamSourceCubit,ExamSourceState>(
        "should return emit[ExamSourceLoadingState , ExamSourceSuccessState] when call do Action(CheckAnswerQuestionButtonAction) is Successfully " ,
        build: () {
           checkQuestionEntity=CheckQuestionEntity();
           checkAnswerRequest=CheckAnswerRequest(examEntity: ExamEntity());
        var mockedResult=Success<CheckQuestionEntity>(date: checkQuestionEntity);
        provideDummy<ApiResult<CheckQuestionEntity>>(mockedResult);
          return examSourceCubit;
        },
      act: (bloc) => examSourceCubit.doAction(CheckAnswerQuestionButtonAction(checkAnswerRequest:checkAnswerRequest)),
      expect: () => <TypeMatcher<ExamSourceState>>[
        isA<CheckAnswerQuestionLoadingState>(),
        isA<CheckAnswerQuestionSuccessState>(),
      ],
    );
    blocTest<ExamSourceCubit,ExamSourceState>(
      "should return emit[ExamSourceLoadingState , ExamSourceFailuresState] when call do Action(CheckAnswerQuestionButtonAction) is failures " ,
      build: () {
        checkQuestionEntity=CheckQuestionEntity();
        checkAnswerRequest=CheckAnswerRequest(examEntity: ExamEntity());
        var mockedResult=Failures<CheckQuestionEntity>(exception: Exception());
        provideDummy<ApiResult<CheckQuestionEntity>>(mockedResult);
        return examSourceCubit;
      },
      act: (bloc) => examSourceCubit.doAction(CheckAnswerQuestionButtonAction(checkAnswerRequest:checkAnswerRequest)),
      expect: () => <TypeMatcher<ExamSourceState>>[
        isA<CheckAnswerQuestionLoadingState>(),
        isA<CheckAnswerQuestionFailuresState>(),
      ],
    );
    blocTest<ExamSourceCubit,ExamSourceState>(
      "should return emit[NavigateToStartExamScreenState] when call do Action(CheckAnswerQuestionButtonAction) " ,
      build: () =>examSourceCubit,
      act: (bloc) => examSourceCubit.doAction(NavigateToStartExamAction()),
      expect: () => <TypeMatcher<ExamSourceState>>[
        isA<NavigateToStartExamScreenState>(),
      ],
    );


    test("test method formatPercentage ", () {
      examSourceCubit.doAction(FormatPercentageTargetAction(percentageWithSymbol: "13131%"));
      expect(examSourceCubit.roundedPercentage, 13131);
      expect(examSourceCubit.totalText, "13131%");
    },);
    },);

}