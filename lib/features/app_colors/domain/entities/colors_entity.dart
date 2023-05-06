import 'package:flutter/material.dart';

typedef ColorsEntityId = String;

class ColorsEntity {
  final ColorsEntityId name;  // id
  final DateTime created;

  final Color mainDark;
  final Color midDark;
  final Color midLight;
  final Color mainLight;

  final Color actInfo;
  final Color actSuccess;
  final Color actWrong;

  ColorsEntity({
    required this.name,
    required this.created,
    required this.mainDark,
    required this.midDark,
    required this.midLight,
    required this.mainLight,
    required this.actInfo,
    required this.actSuccess,
    required this.actWrong,
  });
}
