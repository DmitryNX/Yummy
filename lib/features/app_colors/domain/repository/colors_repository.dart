import 'package:dartz/dartz.dart';
import 'package:yummy/core/error/failure.dart';
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart';

import '../../data/models/colors_model.dart';

abstract class ColorsRepository {
  Future<Either<Failure, List<ColorsEntity>>> getAllColorSets();
  Future<Either<Failure, void>> saveColorSet(ColorsModel entity);
  Future<Either<Failure, void>> removeColorSet(ColorsEntityId id);
}
