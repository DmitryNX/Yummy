import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yummy/features/app_colors/data/datasources/colors_datasource_hive.dart';
import 'package:yummy/features/app_colors/data/models/colors_model.dart';
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart';

import '../../../resources.dart';
import 'colors_datasource_hive_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<Box>()
])

void main() {
  group('ColorsDatasourceHive', () {
    late MockBox colorsCollection;

    ColorsDatasourceHive initDatasource() {
      return ColorsDatasourceHive(
        colorsCollection: colorsCollection,
      );
    }

    setUp(() async {
      // await Hive.initFlutter();
      colorsCollection = MockBox(); // await Hive.openBox('colors');
    });

    test(
      'getAllColorSets success',
      () {
        // Assign
        final datasource = initDatasource();

        when(
          colorsCollection.values
        ).thenReturn([
          jsonMapOfColorsEntity,
          jsonMapOfColorsEntity,
        ]);

        // Act
        final result = datasource.getAllColorSets();

        // Assert
        expect(result, isA<Future<List<ColorsEntity>>>());
        verify(colorsCollection.values);
      },
    );

    test(
      'removeColorSet success',
      () {
        // Assign
        final datasource = initDatasource();
        const id = '1';

        // // Act
        final result = datasource.removeColorSet(id);

        // Assert
        expect(result, isA<Future<void>>());
        verify(colorsCollection.delete(id));
      },
    );

    test(
      'saveColorSet success',
      () {
        // Assign
        final datasource = initDatasource();
        final entity = ColorsModel.fromMap(jsonMapOfColorsEntity);

        // Act
        final result = datasource.saveColorSet(entity);

        // Assert
        expect(result, isA<Future<void>>());
        verify(colorsCollection.put(
          entity.name,
          entity.toMap(),
        ));
      },
    );
  });
}
