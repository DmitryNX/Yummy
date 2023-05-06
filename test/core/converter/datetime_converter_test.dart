import 'package:flutter_test/flutter_test.dart';
import 'package:yummy/core/convert/datetime_converter.dart';

void main() {
  test(
    'DatetimeConverter.toStringValue',
    () {
      // Assign
      final value = DateTime(2023, 2, 23, 21, 50, 5);
      const stringValue = '2023-02-23T21:50:05.000';

      // Act
      final result = DateTimeConverter.toStringValue(value);

      // Assert
      expect(result, stringValue);
    },
  );

  test(
    'DatetimeConverter.fromStringValue',
        () {
      // Assign
      final value = DateTime(2023, 2, 23, 21, 50, 5);
      const stringValue = '2023-02-23T21:50:05.000';

      // Act
      final result = DateTimeConverter.fromStringValue(stringValue);

      // Assert
      expect(result, value);
    },
  );
}
