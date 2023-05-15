import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yummy/core/error/failure.dart';
import 'package:yummy/features/app_colors/data/models/colors_model.dart';
import 'package:yummy/features/app_colors/domain/repository/colors_repository.dart';
import 'package:yummy/features/app_colors/domain/usecases/save_color_set_usecase.dart';

import '../../../../resources.dart';
@GenerateNiceMocks([
  MockSpec<ColorsRepository>(),
])
import 'save_color_set_usecase_test.mocks.dart';

void main() {
  Future<void> foldResult(Future<Either<Failure, void>> result) async {
    (await result).fold(
      (error) {
        expect(error, isA<Failure>());
      },
      (value) {
        // expect(value, isA<void>());
        // expect(value, equals(null));
      },
    );
  }


  test('saveColorSet success', () async {
    // Arrange
    final mockRepository = MockColorsRepository();
    final saveColorSet = SaveColorSet(
      repository: mockRepository,
    );

    final entity = colorsModel;

    final Future<Either<Failure, void>> response =
      Future.value(const Right(null));

    when(mockRepository.saveColorSet(entity))
      .thenAnswer((_) => response);

    // Act
    final result = saveColorSet(
      SaveColorSetParams(entity),
    );

    // Assert
    verify(mockRepository.saveColorSet(entity));
    expect(result, equals(response));

    await foldResult(result);
  });
}
