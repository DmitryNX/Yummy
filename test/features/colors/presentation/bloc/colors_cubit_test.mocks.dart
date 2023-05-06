// Mocks generated by Mockito 5.4.0 from annotations
// in yummy/test/features/colors/presentation/bloc/colors_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:yummy/core/error/failure.dart' as _i6;
import 'package:yummy/features/app_colors/data/models/colors_model.dart'
    as _i11;
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart'
    as _i7;
import 'package:yummy/features/app_colors/domain/repository/colors_repository.dart'
    as _i2;
import 'package:yummy/features/app_colors/domain/usecases/calculate_color_set_usecase.dart'
    as _i10;
import 'package:yummy/features/app_colors/domain/usecases/get_all_colors_sets_usecase.dart'
    as _i4;
import 'package:yummy/features/app_colors/domain/usecases/remove_color_set_usecase.dart'
    as _i9;
import 'package:yummy/features/app_colors/domain/usecases/save_color_set_usecase.dart'
    as _i8;

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

class _FakeColorsRepository_0 extends _i1.SmartFake
    implements _i2.ColorsRepository {
  _FakeColorsRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetAllColorSets].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllColorSets extends _i1.Mock implements _i4.GetAllColorSets {
  @override
  _i2.ColorsRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeColorsRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeColorsRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.ColorsRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.ColorsEntity>>> call(
          _i4.GetAllColorSetsParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.ColorsEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.ColorsEntity>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.ColorsEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.ColorsEntity>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.ColorsEntity>>>);
}

/// A class which mocks [SaveColorSet].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveColorSet extends _i1.Mock implements _i8.SaveColorSet {
  @override
  _i2.ColorsRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeColorsRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeColorsRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.ColorsRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, void>> call(
          _i8.SaveColorSetParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, void>>.value(
            _FakeEither_1<_i6.Failure, void>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, void>>.value(
                _FakeEither_1<_i6.Failure, void>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, void>>);
}

/// A class which mocks [RemoveColorSet].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveColorSet extends _i1.Mock implements _i9.RemoveColorSet {
  @override
  _i2.ColorsRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeColorsRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeColorsRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.ColorsRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, void>> call(
          _i9.RemoveColorSetParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, void>>.value(
            _FakeEither_1<_i6.Failure, void>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, void>>.value(
                _FakeEither_1<_i6.Failure, void>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, void>>);
}

/// A class which mocks [CalculateColorSet].
///
/// See the documentation for Mockito's code generation for more information.
class MockCalculateColorSet extends _i1.Mock implements _i10.CalculateColorSet {
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i11.ColorsModel>> call(
          _i10.CalculateColorSetParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, _i11.ColorsModel>>.value(
                _FakeEither_1<_i6.Failure, _i11.ColorsModel>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, _i11.ColorsModel>>.value(
                _FakeEither_1<_i6.Failure, _i11.ColorsModel>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i11.ColorsModel>>);
}