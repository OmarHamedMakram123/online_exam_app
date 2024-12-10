import 'package:flutter_test/flutter_test.dart';
import 'package:online_exam_app/src/data/mappers/subject_mapper.dart';
import 'package:online_exam_app/src/data/model/response/subject_response_model/subject_response_model.dart';

void main() {
  group(
    "Test Subject Mappers ",
    () {
      SubjectMapper subjectMapper = SubjectMapperImpl();
      test(
        "should return emptyList when call subjectMapper.toSubjectEntity is null",
        () {
          SubjectResponseModel subjectResponseModel =
              SubjectResponseModel(subjects: []);
          var actual = subjectMapper.toSubjectEntity(subjectResponseModel);
          expect(actual, []);
        },
      );
      test(
        "should return  subjectListEntity when call  subjectMapper.toSubjectEntity if not List Empty",
        () {
          SubjectResponseModel subjectResponseModel = SubjectResponseModel(
              subjects: [
                Subjects(name: "omar", createdAt: "", icon: "omar", Id: "1")
              ]);
          var actual = subjectMapper.toSubjectEntity(subjectResponseModel);
          expect(actual[0].name, "omar");
          expect(actual.length, 1);
        },
      );
    },
  );
}
