// Mocks generated by Mockito 5.4.4 from annotations
// in online_exam_app/test/src/data/data_source/offline_data_source/auth_offline_data_source/auth_offline_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:online_exam_app/core/caching/secure_storge/caching_Data.dart'
    as _i2;

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

/// A class which mocks [CachingDataSecureStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockCachingDataSecureStorage extends _i1.Mock
    implements _i2.CachingDataSecureStorage {
  MockCachingDataSecureStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> writeData({
    required String? key,
    required String? value,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #writeData,
          [],
          {
            #key: key,
            #value: value,
          },
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<String?> readData({required String? key}) => (super.noSuchMethod(
        Invocation.method(
          #readData,
          [],
          {#key: key},
        ),
        returnValue: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);

  @override
  _i3.Future<void> deleteData({required String? key}) => (super.noSuchMethod(
        Invocation.method(
          #deleteData,
          [],
          {#key: key},
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}