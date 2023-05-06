import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yummy/core/error/failure.dart';
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart';
import 'package:yummy/features/app_colors/domain/repository/colors_repository.dart';
import 'package:yummy/features/app_colors/domain/usecases/remove_color_set_usecase.dart';

@GenerateNiceMocks([
  MockSpec<ColorsRepository>(),
])
import 'remove_color_set_test.mocks.dart';

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

  test('remove success', () async {
    // Arrange
    final mockRepository = MockColorsRepository();
    final removeColorSet = RemoveColorSet(
      repository: mockRepository,
    );

    const ColorsEntityId entityId = "test";

    final Future<Either<Failure, void>> response =
      Future.value(const Right(null));

    when(mockRepository.removeColorSet(any))
        .thenAnswer((_) => response);

    // Act
    final result = removeColorSet(
      const RemoveColorSetParams(entityId),
    );

    // Assert
    verify(mockRepository.removeColorSet(entityId));
    expect(result, equals(response));

    await foldResult(result);
  });
}
