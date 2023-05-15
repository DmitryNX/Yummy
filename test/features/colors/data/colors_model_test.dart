import 'package:flutter_test/flutter_test.dart';
import 'package:yummy/features/app_colors/data/models/colors_model.dart';

import '../../../resources.dart';

void main() {
  test(
    'Constructor.fromMap of successful data',
    () async {
      // Assign
      final value = colorsModel;

      // Act
      final result = ColorsModel.fromMap(jsonMapOfColorsEntity);

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
      final value = colorsModel;

      // Act
      final result = value.toMap();

      // Assert
      expect(result, equals(jsonMapOfColorsEntity));
    },
  );

  test(
    'toMap and fromMap of successful data',
    () async {
      // Assign
      final value = colorsModel;

      // Act
      final entity = ColorsModel.fromMap(jsonMapOfColorsEntity);
      final result = entity.toMap();

      // Assert
      expect(result, equals(jsonMapOfColorsEntity));
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
