import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
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

      when(mockRemoveColorSet(any)).thenAnswer((_) =>
        Future.value(const Left(LocalFailure(errorMessage))));

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

      when(mockGetAllColorSets(GetAllColorSetsParams()))
        .thenAnswer((_) => Future.value(const Right([])));

      when(mockSaveColorSet(any))
        .thenAnswer((_) => Future.value(const Right(null)));

      // Act
      await cubit.getAllColorSets();
      await cubit.createColorSet(id);

      // Assert
      verify(mockSaveColorSet(any));
      expect(cubit.state, isA<LoadedColorsState>());
      expect((cubit.state as LoadedColorsState).items.length, 1);
    },
  );

  test(
    'createColorSet failure',
    () async {
      // Assign
      const id = 'test';

      final response = generateItems();
      when(mockGetAllColorSets(GetAllColorSetsParams()))
          .thenAnswer((_) => Future.value(Right(response)));

      when(mockSaveColorSet(any)).thenAnswer((_) =>
          Future.value(const Left(LocalFailure(errorMessage))));

      await cubit.getAllColorSets();

      final states = [
        const ErrorColorsState(message: errorMessage),
      ];

      // Assert latter
      expectLater(cubit.stream.asBroadcastStream(), emitsInOrder(states));

      // Act
      await cubit.createColorSet(id);

      // Assert
      verify(mockSaveColorSet(any));
      expect(cubit.state, isA<ErrorColorsState>());
    },
  );
}

List<ColorsModel> generateItems() {
  final value = generateItem('test 1');
  return [
    value,
    ColorsModel.fromMap(value.toMap()
      ..['name'] = 'test 2'),
    ColorsModel.fromMap(value.toMap()
      ..['name'] = 'test 3'),
    ColorsModel.fromMap(value.toMap()
      ..['name'] = 'test 4'),
    ColorsModel.fromMap(value.toMap()
      ..['name'] = 'test 5'),
  ];
}

ColorsModel generateItem(String name) {
  return ColorsModel(
    name: name,
    created: DateTime(2023, 2, 23, 21, 50, 5),
    mainDark: const Color.fromARGB(255, 12, 33, 104),
    midDark: const Color.fromARGB(255, 20, 55, 173),
    midLight: const Color.fromARGB(255, 66, 90, 173),
    mainLight: const Color.fromARGB(255, 112, 126, 173),
    actInfo: const Color.fromARGB(255, 17, 68, 170),
    actSuccess: const Color.fromARGB(255, 4, 132, 157),
    actWrong: const Color.fromARGB(255, 216, 0, 93),
  );
}
