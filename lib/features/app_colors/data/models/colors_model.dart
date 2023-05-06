import 'package:flutter/material.dart';
import 'package:yummy/core/convert/color_converter.dart';
import 'package:yummy/core/convert/datetime_converter.dart';
import 'package:yummy/core/generator/color_generator.dart';
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart';

class ColorsModel extends ColorsEntity {
  ColorsModel({
    required super.name,
    required super.created,
    required super.mainDark,
    required super.midDark,
    required super.midLight,
    required super.mainLight,
    required super.actInfo,
    required super.actSuccess,
    required super.actWrong,
  });

  factory ColorsModel.fromMap(Map<String, dynamic> json) {
    return ColorsModel(
      name: json['name'],
      created: DateTimeConverter.fromStringValue(json['created']),
      mainDark: ColorConverter.fromHex(json['mainDark']) ?? Colors.black,
      midDark: ColorConverter.fromHex(json['midDark']) ?? Colors.black12,
      midLight: ColorConverter.fromHex(json['midLight']) ?? Colors.grey,
      mainLight: ColorConverter.fromHex(json['mainLight']) ?? Colors.white,
      actInfo: ColorConverter.fromHex(json['actInfo']) ?? Colors.blue,
      actSuccess: ColorConverter.fromHex(json['actSuccess']) ?? Colors.green,
      actWrong: ColorConverter.fromHex(json['actWrong']) ?? Colors.red,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'created': DateTimeConverter.toStringValue(created),
      'mainDark': ColorConverter.toHex(mainDark),
      'midDark': ColorConverter.toHex(midDark),
      'midLight': ColorConverter.toHex(midLight),
      'mainLight': ColorConverter.toHex(mainLight),
      'actInfo': ColorConverter.toHex(actInfo),
      'actSuccess': ColorConverter.toHex(actSuccess),
      'actWrong': ColorConverter.toHex(actWrong),
    };
  }

  factory ColorsModel.random(ColorsEntityId name) {
    return ColorsModel(
      name: name,
      created: DateTime.now(),
      mainDark: ColorGenerator.randomColor(),
      midDark: ColorGenerator.randomColor(),
      midLight: ColorGenerator.randomColor(),
      mainLight: ColorGenerator.randomColor(),
      actInfo: ColorGenerator.randomColor(),
      actSuccess: ColorGenerator.randomColor(),
      actWrong: ColorGenerator.randomColor(),
    );
  }
}
