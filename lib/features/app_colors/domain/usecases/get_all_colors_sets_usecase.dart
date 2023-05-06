import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:yummy/core/error/failure.dart';
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/colors_repository.dart';

class GetAllColorSets implements UseCase<List<ColorsEntity>, GetAllColorSetsParams> {
  final ColorsRepository repository;

  GetAllColorSets({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<ColorsEntity>>> call(
      GetAllColorSetsParams params,
  ) {
    return repository.getAllColorSets();
  }
}

class GetAllColorSetsParams extends Equatable {
  @override
  List<Object?> get props => [];
}
