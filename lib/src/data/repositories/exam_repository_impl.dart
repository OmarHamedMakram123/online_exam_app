import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api/common/api_result.dart';
import 'package:online_exam_app/core/api/common/excute_api_method.dart';
import 'package:online_exam_app/src/data/data_source/online_data_source/exam_online_data_source/exam_online_data_source.dart';
import 'package:online_exam_app/src/data/mappers/exam_mapper.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';

import '../../domain/repositories/exam_repository.dart';

@Injectable(as: ExamRepository)
class ExamRepositoryImpl implements ExamRepository {
  final ExamOnlineDataSource examOnlineDataSource;
  final ExamMapper examMapper;
  ExamRepositoryImpl(
      {required this.examOnlineDataSource, required this.examMapper});
  @override
  Future<ApiResult<List<ExamEntity>>> getExamOnSubject(
      {required String subjectId}) async {
    return executeApi<List<ExamEntity>>(
      apiCall: () async {
        var examResponseModel =
            await examOnlineDataSource.getExamOnSubjectId(subjectId: subjectId);
        return examMapper.toExamEntity(examResponseModel);
      },
    );
  }
}
