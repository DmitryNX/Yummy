import 'package:flutter/material.dart';

class ColorConverter {
  ColorConverter._();

  static String toHex(Color value) {
    return '#${_toHexBase(value)}';
  }

  static String toHexValue(Color value) {
    return '0x${_toHexBase(value)}';
  }

  static String _toHexBase(Color value) {
    return _byteToHex(value.alpha) +
        _byteToHex(value.red) +
        _byteToHex(value.green) +
        _byteToHex(value.blue);
  }


  static Color? fromHex(String value) {
    if (value.length < 9) return null;

    final a = int.tryParse(value.substring(1, 3), radix: 16);
    final r = int.tryParse(value.substring(3, 5), radix: 16);
    final g = int.tryParse(value.substring(5, 7), radix: 16);
    final b = int.tryParse(value.substring(7, 9), radix: 16);

    if (a != null && r != null && g != null && b != null) {
      return Color.fromARGB(a, r, g, b);
    } else {
      return null;
    }
  }

  static String _byteToHex(int value) {
    final result = value
        .toRadixString(16)
        .toUpperCase();

    return result.length == 1
      ? '0$result'
      : result;
  }
}
