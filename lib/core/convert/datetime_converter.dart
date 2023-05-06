class DateTimeConverter {
  DateTimeConverter._();

  static String toStringValue(DateTime value) {
    return value.toIso8601String();
  }

  static DateTime fromStringValue(String value) {
    return DateTime.parse(value);
  }
}