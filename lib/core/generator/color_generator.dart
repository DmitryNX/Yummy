import 'dart:math';

import 'package:flutter/material.dart';

class ColorGenerator {
  ColorGenerator._();

  static Color randomColor() {
    return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  }
}
