import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:yummy/core/error/failure.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/colors_entity.dart';
import '../repository/colors_repository.dart';

class RemoveColorSet implements UseCase<void, RemoveColorSetParams> {
  final ColorsRepository repository;

  RemoveColorSet({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(
    RemoveColorSetParams params,
  ) {
    return repository.removeColorSet(params.entityId);
  }
}

class RemoveColorSetParams extends Equatable {
  final ColorsEntityId entityId;

  const RemoveColorSetParams(this.entityId);

  @override
  List<Object?> get props => [entityId];
}
