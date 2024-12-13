
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';
import 'package:online_exam_app/src/domain/repositories/exam_repository.dart';

import '../../../core/api/common/api_result.dart';

@injectable
class GetExamOnSubjectUseCase{
 final ExamRepository examRepository;
  GetExamOnSubjectUseCase({required this.examRepository});
  Future<ApiResult<List<ExamEntity>>>invoke({required String subjectId }){
    return examRepository.getExamOnSubject(subjectId: subjectId);
  }
}