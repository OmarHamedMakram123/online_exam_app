import 'package:injectable/injectable.dart';

import '../../domain/entities/exam_entity.dart';
import '../model/response/exam_response_model/exam_response_model.dart';

abstract class ExamMapper{
  List<ExamEntity>toExamEntity(ExamResponseModel examResponseModel);
}


@Injectable(as: ExamMapper)
class ExamMapperImpl implements ExamMapper{
  @override
  List<ExamEntity>toExamEntity(ExamResponseModel examResponseModel) {
    if(examResponseModel.exams ==null )return [];
   List<ExamEntity>exams= examResponseModel.exams!.map((e) => _toExamEntity(e),).toList();
   return exams;
  }


  ExamEntity _toExamEntity(Exams exams){
    return ExamEntity(
      id: exams.Id,
      numberOfQuestions: exams.numberOfQuestions,
      duration: exams.duration,
      title: exams.title,
      createdAt: exams.createdAt
    );
  }
}