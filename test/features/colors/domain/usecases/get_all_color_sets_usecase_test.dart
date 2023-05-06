import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yummy/core/error/failure.dart';
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart';
import 'package:yummy/features/app_colors/domain/repository/colors_repository.dart';
import 'package:yummy/features/app_colors/domain/usecases/get_all_colors_sets_usecase.dart';

@GenerateNiceMocks([
  MockSpec<ColorsRepository>(),
])
import 'get_all_color_sets_usecase_test.mocks.dart';


void main() {

  Future<void> foldResult(Future<Either<Failure, List<ColorsEntity>>> result) async {
    (await result).fold(
      (error) {
        expect(error, isA<Failure>());
      },
      (array) {
        expect(array, isA<List<ColorsEntity>>());
        expect(array.length, equals(0));
      },
    );
  }

  test(
    'getAllColorSets success',
    () async {
      // Arrange
      final mockRepository = MockColorsRepository();
      final getAllColorSets = GetAllColorSets(
        repository: mockRepository,
      );

      final Future<Either<Failure, List<ColorsEntity>>> entity =
        Future.value(const Right(<ColorsEntity>[]));

      when(mockRepository.getAllColorSets())
        .thenAnswer((_) => entity);

      // Act
      final result = getAllColorSets(
        GetAllColorSetsParams()
      );

      // Assert
      verify(mockRepository.getAllColorSets());
      expect(result, equals(entity));

      await foldResult(result);
    },
  );

  test(
    'getAllColorSets failure',
    () async {
      // Arrange
      final mockRepository = MockColorsRepository();
      final getAllColorSets = GetAllColorSets(
        repository: mockRepository,
      );

      final Future<Either<Failure, List<ColorsEntity>>> failure =
        Future.value(const Left(LocalFailure("Test failure.")));

      when(mockRepository.getAllColorSets())
        .thenAnswer((_) => failure);

      // Act
      final result = getAllColorSets(
        GetAllColorSetsParams(),
      );

      // Assert
      verify(mockRepository.getAllColorSets());
      expect(result, equals(failure));

      await foldResult(result);
    },
  );
}
