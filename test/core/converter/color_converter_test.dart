import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yummy/core/convert/color_converter.dart';

void main() {
  test(
    'ColorConverter.toHex() successful.',
    () {
      // Assign
      const value = '#FFFF0000';
      const colorValue = Color(0xFFFF0000);

      // Act
      final result = ColorConverter.toHex(colorValue);

      // Assert
      expect(result, value);
    },
  );

  test(
    'ColorConverter.fromHex() successful.',
    () {
      // Assign
      const value = '#FFFF0000';
      const colorValue = Color(0xFFFF0000);

      // Act
      final result = ColorConverter.fromHex(value);

      // Assert
      expect(result, isNotNull);
      expect(result, colorValue);
    },
  );

  test(
    'ColorConverter.fromHex() failure, small length.',
    () {
      // Assign
      const value = '#de';

      // Act
      final result = ColorConverter.fromHex(value);

      // Assert
      expect(result, isNull);
    },
  );

  test(
    'ColorConverter.fromHex() failure, wrong value.',
        () {
      // Assign
      const value = '#dafsf hfgdgsde';

      // Act
      final result = ColorConverter.fromHex(value);

      // Assert
      expect(result, isNull);
    },
  );

  test(
    'ColorConverter convert transparent successful.',
    () {
      // Assign
      const value = '#00000000';
      const colorValue = Colors.transparent;

      // Act
      final resultString = ColorConverter.toHex(colorValue);
      final result = ColorConverter.fromHex(resultString);

      // Assert
      expect(resultString, value);
      expect(result, isNotNull);
      expect(result, colorValue);
    },
  );
}
