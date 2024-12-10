import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/core/error/error_handler.dart';
import 'package:online_exam_app/core/error/error_model.dart';
import 'package:online_exam_app/src/presentation/subject/view_modekl/subject_action.dart';

import '../../../domain/entities/subject_entity.dart';
import '../../../domain/use_case/get_all_subject_use_case.dart';

part 'subject_state.dart';
@injectable
class SubjectCubit extends Cubit<SubjectState> {
  GetAllSubjectUseCase getAllSubjectUseCase;
  SubjectCubit(this.getAllSubjectUseCase) : super(SubjectInitial());

  Future<void>doAction(SubjectAction subjectAction)async{
    switch (subjectAction) {
      case GetAllSubjectAction():
        return await _getAllSubject();
    }
  }



  List<SubjectEntity> subject = [];
  Future<void> _getAllSubject() async {
    emit(GetAllSubjectLoadingState());
    var result = await getAllSubjectUseCase.invoke();
    switch (result) {
      case Success<List<SubjectEntity>>():
        subject=result.date;
        emit(GetAllSubjectSuccessState(subject: result.date));
      case Failures<List<SubjectEntity>>():
        ErrorModel errorModel =
            ErrorHandler.formException(result.exception);
        emit(GetAllSubjectFailuresState(errorModel: errorModel));
    }
  }
}
