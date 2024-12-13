import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/core/error/error_handler.dart';
import 'package:online_exam_app/core/error/error_model.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/result_offline_data_source/exam_offline_data_source/exam_offline_data_source.dart';
import 'package:online_exam_app/src/data/model/request/check_answer_request.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';
import '../../../domain/entities/question_entity.dart';
import '../../../domain/use_case/get_all_question_on_exam_by_id_use_case.dart';

part 'questions_state.dart';

@injectable
class QuestionsCubit extends Cubit<QuestionsState> {
  final GetAllQuestionOnExamByIdUseCase getAllQuestionOnExamByIdUseCase;
  QuestionsCubit(this.getAllQuestionOnExamByIdUseCase)
      : super(QuestionsInitial());
  static QuestionsCubit of(context) => BlocProvider.of(context);

  int currentIndexOptionsAnswer = -1;
  int questionIndex=0;
  List<QuestionEntity> questions = [];
  List<Answers>answer=[];
  ExamEntity examEntity=ExamEntity();


  void changeSelectedOptionsAnswer(int newIndex) {
    currentIndexOptionsAnswer = newIndex;
    _updateAnswerQuestion();
    emit(ChangeSelectedOptionsAnswerState());
  }
  void decrementCurrentQuestionIndex() {
    if (questionIndex > 0) {
      questionIndex--;
      getCurrentSelectedOptions();
      emit(ChangeCurrentQuestionIndexState());
    }
  }
  void incrementCurrentQuestionIndex() {
    if (questionIndex == questions.length-1)
    {
      _navigateToExamScoreScreen();
      return;
    }
      questionIndex+=1;
      getCurrentSelectedOptions();
      emit(ChangeCurrentQuestionIndexState());
    //}
  }
  String getNextButtonText() {
    if (questionIndex == questions.length-1)
    {
      return "Finish";
    }
    else {
      return "Next";
    }
  }
  void _initializeAnswersList(){
    for(int i=0 ; i < questions.length ; i++){
      answer.add(Answers(
        questionId: questions[i].questionId,
        correct: "o",
        currentIndexOptionSelection: -1
      ));
    }}
  int getCurrentSelectedOptions(){
    return answer[questionIndex].currentIndexOptionSelection ?? -1;
  }
  void _updateAnswerQuestion(){
    Answers answers=answer[questionIndex];
    answers.currentIndexOptionSelection = currentIndexOptionsAnswer;
    answers.questionId = questions[questionIndex].questionId ?? "";
    answers.correct = questions[questionIndex].answer?[currentIndexOptionsAnswer].key ?? "A1";
  }
  Future<void> getAllQuestionOnExamById({required String examId}) async {
    emit(GetAllQuestionOnExamByIdLoadingState());
    var result = await getAllQuestionOnExamByIdUseCase.invoke(examId: examId);
    switch (result) {
      case Success<List<QuestionEntity>>():
        questions = result.date;
       await CachedOfflineDataSource.cachedQuestionById(questionEntity: questions);
        _initializeAnswersList();
        emit(GetAllQuestionOnExamByIdSuccessState());
      case Failures<List<QuestionEntity>>():
        ErrorModel errorModel = ErrorHandler.formException(result.exception);
        emit(GetAllQuestionOnExamByIdFailuresState(errorModel: errorModel));
    }
  }
  void _navigateToExamScoreScreen(){
    emit(NavigateToExamSourceScreen());
  }
}

