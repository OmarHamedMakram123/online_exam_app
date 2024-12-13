import 'package:online_exam_app/src/data/mappers/exam_mapper.dart';
import 'package:online_exam_app/src/data/model/response/exam_response_model/exam_response_model.dart';
import 'package:online_exam_app/src/domain/entities/exam_entity.dart';
import 'package:test/test.dart';

void main() {
  ExamMapperImpl examMapperImpl=ExamMapperImpl();
  test('should return empty list examEntity when call examMapper.toListExamEntity', () {
    ExamResponseModel examResponseModel=ExamResponseModel(exams: []);
    List<ExamEntity>exams=[];
     var actual=examMapperImpl.toExamEntity(examResponseModel);
    expect(actual, exams);
  });

  test('should return listExamEntity when call examMapper.toListExamEntity', () {
    ExamResponseModel examResponseModel=ExamResponseModel(exams: [Exams(title: "omar",)]);
    var actual=examMapperImpl.toExamEntity(examResponseModel);
    expect(actual[0].title, "omar" );
  });
}