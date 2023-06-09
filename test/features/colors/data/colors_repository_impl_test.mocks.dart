// Mocks generated by Mockito 5.4.0 from annotations
// in yummy/test/features/colors/data/colors_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:yummy/features/app_colors/data/datasources/colors_datasource.dart'
    as _i2;
import 'package:yummy/features/app_colors/data/models/colors_model.dart' as _i5;
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ColorsDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockColorsDatasource extends _i1.Mock implements _i2.ColorsDatasource {
  @override
  _i3.Future<List<_i4.ColorsEntity>> getAllColorSets() => (super.noSuchMethod(
        Invocation.method(
          #getAllColorSets,
          [],
        ),
        returnValue:
            _i3.Future<List<_i4.ColorsEntity>>.value(<_i4.ColorsEntity>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.ColorsEntity>>.value(<_i4.ColorsEntity>[]),
      ) as _i3.Future<List<_i4.ColorsEntity>>);
  @override
  _i3.Future<void> saveColorSet(_i5.ColorsModel? entity) => (super.noSuchMethod(
        Invocation.method(
          #saveColorSet,
          [entity],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> removeColorSet(String? id) => (super.noSuchMethod(
        Invocation.method(
          #removeColorSet,
          [id],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
