import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/data/model/response/subject_response_model/subject_response_model.dart';

import '../../domain/entities/subject_entity.dart';

abstract class SubjectMapper {
  List<SubjectEntity> toSubjectEntity(
      SubjectResponseModel subjectResponseModel);
}

@Injectable(as: SubjectMapper)
class SubjectMapperImpl implements SubjectMapper {
  @override
  List<SubjectEntity> toSubjectEntity(
      SubjectResponseModel subjectResponseModel) {
    if (subjectResponseModel.subjects == null) return [];
    List<SubjectEntity> subjects = subjectResponseModel.subjects!
        .map(
          (e) => _toSubjectEntity(e),
        )
        .toList();
    return subjects;
  }

  SubjectEntity _toSubjectEntity(Subjects subject) {
    return SubjectEntity(
        id: subject.Id, name: subject.name, iconImage: subject.icon);
  }
}
