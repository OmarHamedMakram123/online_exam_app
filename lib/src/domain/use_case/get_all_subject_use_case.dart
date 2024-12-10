import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/domain/entities/subject_entity.dart';
import '../../../core/api/common/api_result.dart';
import '../repositories/subject_repository.dart';

@injectable
class GetAllSubjectUseCase{
  final SubjectRepository subjectRepository;
  GetAllSubjectUseCase({required this.subjectRepository});

  Future<ApiResult<List<SubjectEntity>>>invoke()
  {
    return subjectRepository.getAllSubject();
  }
}