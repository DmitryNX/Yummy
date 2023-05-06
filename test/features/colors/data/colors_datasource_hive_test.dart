import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yummy/features/app_colors/data/datasources/colors_datasource_hive.dart';
import 'package:yummy/features/app_colors/data/models/colors_model.dart';
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart';

// import 'colors_datasource_hive_test.mocks.dart';
//
// @GenerateNiceMocks([
//   MockSpec<BoxCollection>()
// ])

void main() {
  group('ColorsDatasourceHive', () {
    late final Box colorsCollection;

    setUpAll(() async {
      await Hive.initFlutter();
      colorsCollection = await Hive.openBox('colors');
    });

    tearDownAll(() {
      colorsCollection.close();
    });

    test(
      'Constructor success',
      () {
        // Assign
        final datasource = ColorsDatasourceHive(
          colorsCollection: colorsCollection,
        );
      },
    );


    test(
      'getAllColorSets success',
      () {
        // Assign
        final datasource = ColorsDatasourceHive(
          colorsCollection: colorsCollection,
        );

        // // Act
        final result = datasource.getAllColorSets();

        // Assert
        expect(result, isA<Future<List<ColorsEntity>>>());
      },
    );

    test(
      'removeColorSet success',
      () {
        // Assign
        final datasource = ColorsDatasourceHive(
          colorsCollection: colorsCollection,
        );

        const id = '1';

        // // Act
        final result = datasource.removeColorSet(id);

        // Assert
        expect(result, isA<Future<void>>());
      },
    );

    test(
      'saveColorSet success',
      () {
        // Assign
        final datasource = ColorsDatasourceHive(
          colorsCollection: colorsCollection,
        );

        final jsonMap = {
          'name': 'test',
          'created': '2023-02-23T21:50:05.000',
          'mainDark': '#FF0C2168',
          'midDark': '#FF1437AD',
          'midLight': '#FF425AAD',
          'mainLight': '#FF707EAD',
          'actInfo': '#FF1144AA',
          'actSuccess': '#FF04849D',
          'actWrong': '#FFD8005D',
        };

        final entity = ColorsModel.fromMap(jsonMap);

        // Act
        final result = datasource.saveColorSet(entity);

        // Assert
        expect(result, isA<Future<void>>());
      },
    );
  });
}
