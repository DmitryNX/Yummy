import 'package:hive/hive.dart';
import 'package:yummy/features/app_colors/data/datasources/colors_datasource.dart';
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart';

import '../models/colors_model.dart';

class ColorsDatasourceHive implements ColorsDatasource {
  final Box colorsCollection;

  ColorsDatasourceHive({
    required this.colorsCollection,
  });

  @override
  Future<List<ColorsEntity>> getAllColorSets() async {
     return colorsCollection.values
      .map((m) => ColorsModel.fromMap(Map<String, dynamic>.from(m)))
      .toList();
  }

  @override
  Future<void> removeColorSet(ColorsEntityId id) async {
    // for (var i = colorsCollection.length-1; i >= 0; --i) {
    //   colorsCollection.deleteAt(i);
    // }
    await colorsCollection.delete(id);
  }

  @override
  Future<void> saveColorSet(ColorsModel entity) async {
    colorsCollection.put(
      entity.name,
      entity.toMap(),
    );
  }
}
