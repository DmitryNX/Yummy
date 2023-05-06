import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:yummy/core/error/failure.dart';
import 'package:yummy/features/app_colors/data/models/colors_model.dart';
import 'package:yummy/features/app_colors/domain/usecases/calculate_color_set_usecase.dart';

void main() {
  const String tName = "Test";
  const Color tMainLight = Colors.white;
  const Color tMainDark = Colors.black;

  // Future<void> foldResult(Either<Failure, ColorsModel> result) async {
  //   result.fold(
  //     (error) {
  //       expect(error, isA<Failure>());
  //     },
  //     (value) {
  //       expect(value, isA<ColorsModel>());
  //       expect(value.name, equals(tName));
  //       expect(value.mainLight, equals(tMainLight));
  //       expect(value.mainDark, equals(tMainDark));
  //
  //       expect(value.midLight, equals(tMainDark));
  //       expect(value.midDark, equals(tMainDark));
  //       expect(value.actInfo, equals(tMainDark));
  //       expect(value.actSuccess, equals(tMainDark));
  //       expect(value.actWrong, equals(tMainDark));
  //     },
  //   );
  // }

  test('calculate with White and Black', () async {
    // Arrange
    final calculateColorSet = CalculateColorSet();

    final tMidLight = Color.lerp(tMainLight, tMainDark, 0.382);
    final tMidDark = Color.lerp(tMainLight, tMainDark, 0.618);

    final midColor = Color.lerp(tMainLight, tMainDark, 0.5);
    final tActInfo = Color.lerp(Colors.blue, midColor, 0.214);
    final tActSuccess = Color.lerp(Colors.green, midColor, 0.214);
    final tActWrong = Color.lerp(Colors.red, midColor, 0.214);

    // final response = {
    //   "name": "Test",
    //   "created": "2023-04-07T14:28:50.477203",
    //   "mainDark": #FF000000,
    //   "midDark": #FF616161,
    //   "midLight": #FF9D9D9D,
    //   "mainLight": #FFFFFFFF,
    //   "actInfo": #FF3591DA,
    //   "actSuccess": #FF56A45A,
    //   "actWrong": #FFDA4F45,
    // };

    // Act
    final result = await calculateColorSet(
      const CalculateColorSetParams(
        name: tName,
        mainLight: tMainLight,
        mainDark: tMainDark,
      ),
    );

    // Assert
    result.fold(
      (error) {
        expect(error, isA<Failure>());
      },
      (value) {
        expect(value, isA<ColorsModel>());
        expect(value.name, equals(tName));
        expect(value.mainLight, equals(tMainLight));
        expect(value.mainDark, equals(tMainDark));

        expect(value.midLight, equals(tMidLight));
        expect(value.midDark, equals(tMidDark));

        expect(value.actInfo, equals(tActInfo));
        expect(value.actSuccess, equals(tActSuccess));
        expect(value.actWrong, equals(tActWrong));
      },
    );
  });
}
