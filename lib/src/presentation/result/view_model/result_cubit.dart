import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/src/data/data_source/offline_data_source/result_offline_data_source/exam_offline_data_source/exam_offline_data_source.dart';
import 'package:online_exam_app/src/data/model/request/check_answer_request.dart';

import '../../../domain/entities/question_entity.dart';

part 'result_state.dart';

class ResultCubit extends Cubit<ResultState> {
  ResultCubit() : super(ResultInitial());


  List<QuestionEntity>questions=[];
  List<Answers>answers=[];


  Future<void>getExamsQuestion()async{
   emit(GetExamsQuestionLoadingState());
   CachedOfflineDataSource.getCachedQuestion();

  }
}
