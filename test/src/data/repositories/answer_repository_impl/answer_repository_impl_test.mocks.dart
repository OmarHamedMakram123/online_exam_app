// Mocks generated by Mockito 5.4.4 from annotations
// in online_exam_app/test/src/data/repositories/answer_repository_impl/answer_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:online_exam_app/src/data/data_source/online_data_source/answer_data_source/answer_online_data_source.dart'
    as _i4;
import 'package:online_exam_app/src/data/mappers/answer_mapper.dart' as _i7;
import 'package:online_exam_app/src/data/model/request/check_answer_request.dart'
    as _i6;
import 'package:online_exam_app/src/data/model/response/check_answer_model/check_answer_question_model.dart'
    as _i2;
import 'package:online_exam_app/src/domain/entities/check_question_entity.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCheckAnswerQuestionModel_0 extends _i1.SmartFake
    implements _i2.CheckAnswerQuestionModel {
  _FakeCheckAnswerQuestionModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCheckQuestionEntity_1 extends _i1.SmartFake
    implements _i3.CheckQuestionEntity {
  _FakeCheckQuestionEntity_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AnswerOnlineDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAnswerOnlineDataSource extends _i1.Mock
    implements _i4.AnswerOnlineDataSource {
  MockAnswerOnlineDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.CheckAnswerQuestionModel> checkAnswerQuestion(
          {required _i6.CheckAnswerRequest? checkAnswerRequest}) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkAnswerQuestion,
          [],
          {#checkAnswerRequest: checkAnswerRequest},
        ),
        returnValue: _i5.Future<_i2.CheckAnswerQuestionModel>.value(
            _FakeCheckAnswerQuestionModel_0(
          this,
          Invocation.method(
            #checkAnswerQuestion,
            [],
            {#checkAnswerRequest: checkAnswerRequest},
          ),
        )),
      ) as _i5.Future<_i2.CheckAnswerQuestionModel>);
}

/// A class which mocks [AnswerMapper].
///
/// See the documentation for Mockito's code generation for more information.
class MockAnswerMapper extends _i1.Mock implements _i7.AnswerMapper {
  MockAnswerMapper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.CheckQuestionEntity toCheckQuestion(
          _i2.CheckAnswerQuestionModel? checkAnswer) =>
      (super.noSuchMethod(
        Invocation.method(
          #toCheckQuestion,
          [checkAnswer],
        ),
        returnValue: _FakeCheckQuestionEntity_1(
          this,
          Invocation.method(
            #toCheckQuestion,
            [checkAnswer],
          ),
        ),
      ) as _i3.CheckQuestionEntity);
}