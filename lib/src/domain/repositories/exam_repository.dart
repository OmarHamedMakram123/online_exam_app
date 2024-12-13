import 'package:online_exam_app/src/domain/entities/exam_entity.dart';

import '../../../core/api/common/api_result.dart';

abstract class ExamRepository
{
  Future<ApiResult<List<ExamEntity>>>getExamOnSubject({required String subjectId});
}