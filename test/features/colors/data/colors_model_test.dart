import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yummy/features/app_colors/data/models/colors_model.dart';
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart';

void main() {
  test(
    'Constructor.fromMap of successful data',
    () async {
      // Assign
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

      final value = ColorsModel(
          name: 'test',
          created: DateTime(2023, 2, 23, 21, 50, 5),
          mainDark: const Color.fromARGB(255, 12, 33, 104),
          midDark: const Color.fromARGB(255, 20, 55, 173),
          midLight: const Color.fromARGB(255, 66, 90, 173),
          mainLight: const Color.fromARGB(255, 112, 126, 173),
          actInfo: const Color.fromARGB(255, 17, 68, 170),
          actSuccess: const Color.fromARGB(255, 4, 132, 157),
          actWrong: const Color.fromARGB(255, 216, 0, 93),
      );

      // Act
      final result = ColorsModel.fromMap(jsonMap);

      // Assert
      expect(result.name, value.name);
      expect(result.mainDark, value.mainDark);
      expect(result.midDark, value.midDark);
      expect(result.midLight, value.midLight);
      expect(result.mainLight, value.mainLight);
      expect(result.actInfo, value.actInfo);
      expect(result.actSuccess, value.actSuccess);
      expect(result.actWrong, value.actWrong);
    },
  );

  test(
    'toMap of successful data',
    () async {
      // Assign
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

      final value = ColorsModel(
        name: 'test',
        created: DateTime(2023, 2, 23, 21, 50, 5),
        mainDark: const Color.fromARGB(255, 12, 33, 104),
        midDark: const Color.fromARGB(255, 20, 55, 173),
        midLight: const Color.fromARGB(255, 66, 90, 173),
        mainLight: const Color.fromARGB(255, 112, 126, 173),
        actInfo: const Color.fromARGB(255, 17, 68, 170),
        actSuccess: const Color.fromARGB(255, 4, 132, 157),
        actWrong: const Color.fromARGB(255, 216, 0, 93),
      );

      // Act
      final result = value.toMap();


      // Assert
      expect(result, equals(jsonMap));
    },
  );

  test(
    'toMap and fromMap of successful data',
    () async {
      // Assign
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

      final value = ColorsModel(
        name: 'test',
        created: DateTime(2023, 2, 23, 21, 50, 5),
        mainDark: const Color.fromARGB(255, 12, 33, 104),
        midDark: const Color.fromARGB(255, 20, 55, 173),
        midLight: const Color.fromARGB(255, 66, 90, 173),
        mainLight: const Color.fromARGB(255, 112, 126, 173),
        actInfo: const Color.fromARGB(255, 17, 68, 170),
        actSuccess: const Color.fromARGB(255, 4, 132, 157),
        actWrong: const Color.fromARGB(255, 216, 0, 93),
      );

      // Act
      final entity = ColorsModel.fromMap(jsonMap);
      final result = entity.toMap();


      // Assert
      expect(result, equals(jsonMap));
      expect(entity.name, value.name);
      expect(entity.mainDark, value.mainDark);
      expect(entity.midDark, value.midDark);
      expect(entity.midLight, value.midLight);
      expect(entity.mainLight, value.mainLight);
      expect(entity.actInfo, value.actInfo);
      expect(entity.actSuccess, value.actSuccess);
      expect(entity.actWrong, value.actWrong);
    },
  );
}
