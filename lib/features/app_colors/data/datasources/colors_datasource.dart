import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart';

import '../models/colors_model.dart';

abstract class ColorsDatasource {
  Future<List<ColorsEntity>> getAllColorSets();
  Future<void> saveColorSet(ColorsModel entity);
  Future<void> removeColorSet(ColorsEntityId id);
}
