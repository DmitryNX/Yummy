import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yummy/core/error/failure.dart';
import 'package:yummy/features/app_colors/data/models/colors_model.dart';
import 'package:yummy/features/app_colors/domain/usecases/calculate_color_set_usecase.dart';
import 'package:yummy/features/app_colors/domain/usecases/get_all_colors_sets_usecase.dart';
import 'package:yummy/features/app_colors/domain/usecases/remove_color_set_usecase.dart';
import 'package:yummy/features/app_colors/domain/usecases/save_color_set_usecase.dart';
import 'package:yummy/features/app_colors/presentation/bloc/colors_cubit.dart';

import '../../../../resources.dart';
@GenerateNiceMocks([
  MockSpec<GetAllColorSets>(),
  MockSpec<SaveColorSet>(),
  MockSpec<RemoveColorSet>(),
  MockSpec<CalculateColorSet>(),
])
import 'colors_cubit_test.mocks.dart';

void main() {
  late MockGetAllColorSets mockGetAllColorSets;
  late MockSaveColorSet mockSaveColorSet;
  late MockRemoveColorSet mockRemoveColorSet;
  late MockCalculateColorSet mockCalculateColorSet;
  late ColorsCubit cubit;

  const errorMessage = 'Test Failure';

  setUp(() {
    mockGetAllColorSets = MockGetAllColorSets();
    mockSaveColorSet = MockSaveColorSet();
    mockRemoveColorSet = MockRemoveColorSet();
    mockCalculateColorSet = MockCalculateColorSet();
    cubit = ColorsCubit(
      getAllColorSets: mockGetAllColorSets,
      saveColorSet: mockSaveColorSet,
      removeColorSet: mockRemoveColorSet,
      calculateColorSet: mockCalculateColorSet,
    );
  });

  test(
    'should getAllColorSets successful',
    () async {
      // Assign
      final response = generateItems();
      when(mockGetAllColorSets(GetAllColorSetsParams()))
          .thenAnswer((_) => Future.value(Right(response)));

      final states = [
        LoadingColorsState(),
        LoadedColorsState(items: response),
      ];

      // Assert latter
      expectLater(cubit.stream.asBroadcastStream(), emitsInOrder(states));

      // Act
      await cubit.getAllColorSets();

      // Assert
      verify(mockGetAllColorSets(GetAllColorSetsParams()));
    },
  );

  test(
    'should getAllColorSets failure',
    () async {
      // Assign
      when(mockGetAllColorSets(GetAllColorSetsParams())).thenAnswer(
        (_) => Future.value(const Left(LocalFailure(errorMessage))),
      );

      final states = [
        LoadingColorsState(),
        const ErrorColorsState(message: errorMessage),
      ];

      // Assert latter
      expectLater(cubit.stream.asBroadcastStream(), emitsInOrder(states));

      // Act
      await cubit.getAllColorSets();

      // Assert
      verify(mockGetAllColorSets(GetAllColorSetsParams()));
    },
  );

  test(
    'saveColorSet successful',
    () async {
      // Assign
      final entity = generateItem('test');

      when(mockSaveColorSet(any))
          .thenAnswer((_) => Future.value(const Right(null)));

      // Act
      await cubit.saveColorSet(entity);

      // Assert
      verify(mockSaveColorSet(SaveColorSetParams(entity)));
    },
  );

  test(
    'saveColorSet failure',
    () async {
      // Assign
      final entity = generateItem('test');

      when(mockSaveColorSet(any)).thenAnswer(
        (_) => Future.value(const Left(LocalFailure(errorMessage))),
      );

      final states = [
        const ErrorColorsState(message: errorMessage),
      ];

      // Assert latter
      expectLater(cubit.stream.asBroadcastStream(), emitsInOrder(states));

      // Act
      await cubit.saveColorSet(entity);

      // Assert
      verify(mockSaveColorSet(SaveColorSetParams(entity)));
    },
  );

  test(
    'removeColorSet successful',
    () async {
      // Assign
      const id = 'test';

      final response = generateItems();
      when(mockGetAllColorSets(GetAllColorSetsParams()))
          .thenAnswer((_) => Future.value(Right(response)));

      when(mockRemoveColorSet(any))
          .thenAnswer((_) => Future.value(const Right(null)));

      await cubit.getAllColorSets();

      // Assert latter
      // expectLater(
      //   cubit.stream.asBroadcastStream(),
      //   neverEmits(const ErrorColorsState(message: errorMessage)),
      // );

      // Act
      await cubit.removeColorSet(id);

      // Assert
      verify(mockRemoveColorSet(const RemoveColorSetParams(id)));
    },
  );

  test(
    'removeColorSet failure',
    () async {
      const id = 'test';

      final response = generateItems();
      when(mockGetAllColorSets(GetAllColorSetsParams()))
          .thenAnswer((_) => Future.value(Right(response)));

      when(mockRemoveColorSet(any)).thenAnswer(
          (_) => Future.value(const Left(LocalFailure(errorMessage))));

      await cubit.getAllColorSets();

      final states = [
        LoadingColorsState(),
        const ErrorColorsState(message: errorMessage),
      ];

      // Assert latter
      expectLater(cubit.stream.asBroadcastStream(), emitsInOrder(states));

      // Act
      await cubit.removeColorSet(id);

      // Assert
      verify(mockRemoveColorSet(const RemoveColorSetParams(id)));
    },
  );

  test(
    'createColorSet successful',
    () async {
      // Assign
      const id = 'test';
      const items = <ColorsModel>[];

      when(mockGetAllColorSets(GetAllColorSetsParams())).thenAnswer(
        (_) => Future.value(const Right(items)),
      );

      when(mockSaveColorSet(any)).thenAnswer(
        (_) => Future.value(const Right(null)),
      );

      when(mockCalculateColorSet(any)).thenAnswer(
        (_) => Future.value(Right(colorsModel)),
      );

      final states = [
        LoadingColorsState(),
        EmptyColorsState(),
        LoadedColorsState(items: [colorsModel]),
      ];

      // Assert latter
      expectLater(cubit.stream.asBroadcastStream(), emitsInOrder(states));

      // Act
      await cubit.getAllColorSets();
      await cubit.createColorSet(id);

      // Assert
      verify(mockCalculateColorSet(any));
      verify(mockSaveColorSet(any));
    },
  );

  test(
    'createColorSet failure on save',
    () async {
      // Assign
      const id = 'test';

      final response = generateItems();
      when(mockGetAllColorSets(GetAllColorSetsParams()))
        .thenAnswer((_) => Future.value(Right(response)));

      when(mockCalculateColorSet(any)).thenAnswer(
        (_) => Future.value(Right(colorsModel)),
      );

      when(mockSaveColorSet(any)).thenAnswer(
        (_) => Future.value(const Left(LocalFailure(errorMessage))),
      );

      await cubit.getAllColorSets();

      final states = [
        const ErrorColorsState(message: errorMessage),
      ];

      // Assert latter
      expectLater(cubit.stream.asBroadcastStream(), emitsInOrder(states));

      // Act
      await cubit.createColorSet(id);

      // Assert
      verify(mockCalculateColorSet(any));
      verify(mockSaveColorSet(any));
    },
  );

  test(
    'createColorSet failure on calculate',
    () async {
      // Assign
      const id = 'test';

      final response = generateItems();
      when(mockGetAllColorSets(GetAllColorSetsParams()))
          .thenAnswer((_) => Future.value(Right(response)));

      when(mockCalculateColorSet(any)).thenAnswer(
        (_) => Future.value(const Left(LocalFailure(errorMessage))),
      );

      when(mockSaveColorSet(any)).thenAnswer(
        (_) => Future.value(const Left(LocalFailure(errorMessage))),
      );

      await cubit.getAllColorSets();

      final states = [
        const ErrorColorsState(message: errorMessage),
      ];

      // Assert latter
      expectLater(cubit.stream.asBroadcastStream(), emitsInOrder(states));

      // Act
      await cubit.createColorSet(id);

      // Assert
      verify(mockCalculateColorSet(any));
    },
  );
}
