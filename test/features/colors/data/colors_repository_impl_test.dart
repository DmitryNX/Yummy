import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yummy/core/error/exception.dart';
import 'package:yummy/core/error/failure.dart';
import 'package:yummy/features/app_colors/data/datasources/colors_datasource.dart';
import 'package:yummy/features/app_colors/data/repository/colors_repository_impl.dart';
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart';

import '../../../resources.dart';
import './colors_repository_impl_test.mocks.dart';
@GenerateNiceMocks([
  MockSpec<ColorsDatasource>(),
])

void main() {
  test(
    'ColorsRepositoryImpl getAllColorSets success',
    () async {
      // Assign
      final mockLocalDatasource = MockColorsDatasource();
      final repository = ColorsRepositoryImpl(
        localDatasource: mockLocalDatasource,
      );

      // Act
      final result = await repository.getAllColorSets();

      // Assert
      verify(mockLocalDatasource.getAllColorSets());
      expect(result, isA<Right<Failure, List<ColorsEntity>>>());
    },
  );

  test(
    'ColorsRepositoryImpl getAllColorSets failure',
    () async {
      // Assign
      final mockLocalDatasource = MockColorsDatasource();
      final repository = ColorsRepositoryImpl(
        localDatasource: mockLocalDatasource,
      );

      when(mockLocalDatasource.getAllColorSets())
        .thenThrow(const LocalException('Test Exception'));

      // Act
      final result = await repository.getAllColorSets();

      // Assert
      verify(mockLocalDatasource.getAllColorSets());
      expect(result, isA<Left<Failure, List<ColorsEntity>>>());
    },
  );

  test(
    'ColorsRepositoryImpl removeColorSet success',
    () async {
      // Assign
      ColorsEntityId id = 'test';
      final mockLocalDatasource = MockColorsDatasource();
      final repository = ColorsRepositoryImpl(
        localDatasource: mockLocalDatasource,
      );

      // Act
      final result = await repository.removeColorSet(id);

      // Assert
      verify(mockLocalDatasource.removeColorSet(id));
      expect(result, isA<Right<Failure, void>>());
    },
  );

  test(
    'ColorsRepositoryImpl removeColorSet failure',
    () async {
      // Assign
      ColorsEntityId id = 'test';
      final mockLocalDatasource = MockColorsDatasource();
      final repository = ColorsRepositoryImpl(
        localDatasource: mockLocalDatasource,
      );

      when(mockLocalDatasource.removeColorSet(id))
          .thenThrow(const LocalException('Test Exception'));

      // Act
      final result = await repository.removeColorSet(id);

      // Assert
      verify(mockLocalDatasource.removeColorSet(id));
      expect(result, isA<Left<Failure, void>>());
    },
  );

  test(
    'ColorsRepositoryImpl saveColorSet success',
    () async {
      // Assign
      final mockLocalDatasource = MockColorsDatasource();
      final repository = ColorsRepositoryImpl(
        localDatasource: mockLocalDatasource,
      );

      final entity = colorsModel;

      // Act
      final result = await repository.saveColorSet(entity);

      // Assert
      verify(mockLocalDatasource.saveColorSet(entity));
      expect(result, isA<Right<Failure, void>>());
    },
  );

  test(
    'ColorsRepositoryImpl saveColorSet failure',
    () async {
      // Assign
      final mockLocalDatasource = MockColorsDatasource();
      final repository = ColorsRepositoryImpl(
        localDatasource: mockLocalDatasource,
      );

      final entity = colorsModel;

      when(mockLocalDatasource.saveColorSet(entity))
          .thenThrow(const LocalException('Test Exception'));

      // Act
      final result = await repository.saveColorSet(entity);

      // Assert
      verify(mockLocalDatasource.saveColorSet(entity));
      expect(result, isA<Left<Failure, void>>());
    },
  );
}
