import 'package:flutter/material.dart';
import 'package:yummy/features/app_colors/data/models/colors_model.dart';

const jsonMapOfColorsEntity = {
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

final colorsModel = ColorsModel(
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

List<ColorsModel> generateItems() {
  final value = generateItem('test 1');
  return <ColorsModel>[
    value,
    ColorsModel.fromMap(value.toMap()
      ..['name'] = 'test 2'),
    ColorsModel.fromMap(value.toMap()
      ..['name'] = 'test 3'),
    ColorsModel.fromMap(value.toMap()
      ..['name'] = 'test 4'),
    ColorsModel.fromMap(value.toMap()
      ..['name'] = 'test 5'),
  ];
}

ColorsModel generateItem(String name) {
  return ColorsModel(
    name: name,
    created: DateTime(2023, 2, 23, 21, 50, 5),
    mainDark: const Color.fromARGB(255, 12, 33, 104),
    midDark: const Color.fromARGB(255, 20, 55, 173),
    midLight: const Color.fromARGB(255, 66, 90, 173),
    mainLight: const Color.fromARGB(255, 112, 126, 173),
    actInfo: const Color.fromARGB(255, 17, 68, 170),
    actSuccess: const Color.fromARGB(255, 4, 132, 157),
    actWrong: const Color.fromARGB(255, 216, 0, 93),
  );
}
