import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:yummy/core/error/failure.dart';

import '../../../../core/usecase/usecase.dart';
import '../../data/models/colors_model.dart';
import '../repository/colors_repository.dart';

class SaveColorSet implements UseCase<void, SaveColorSetParams> {
  final ColorsRepository repository;

  SaveColorSet({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(
    SaveColorSetParams params,
  ) {
    return repository.saveColorSet(params.entity);
  }
}

class SaveColorSetParams extends Equatable {
  final ColorsModel entity;

  const SaveColorSetParams(this.entity);

  @override
  List<Object?> get props => [entity];
}
