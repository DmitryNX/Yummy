import 'package:dartz/dartz.dart';
import 'package:yummy/core/error/exception.dart';
import 'package:yummy/core/error/failure.dart';
import 'package:yummy/features/app_colors/data/datasources/colors_datasource.dart';
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart';
import 'package:yummy/features/app_colors/domain/repository/colors_repository.dart';

import '../models/colors_model.dart';

class ColorsRepositoryImpl implements ColorsRepository {
  ColorsRepositoryImpl({
    required this.localDatasource,
  });

  final ColorsDatasource localDatasource;

  @override
  Future<Either<Failure, List<ColorsEntity>>> getAllColorSets() async {
    try {
      return Right(await localDatasource.getAllColorSets());
    }
    on LocalException catch (e, _) {
      return Left(LocalFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> saveColorSet(ColorsModel entity) async {
    try {
      return Right(await localDatasource.saveColorSet(entity));
    }
    on LocalException catch (e, _) {
      return Left(LocalFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> removeColorSet(ColorsEntityId id) async {
    try {
      return Right(await localDatasource.removeColorSet(id));
    }
    on LocalException catch (e, _) {
      return Left(LocalFailure(e.message));
    }
  }
}
