import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:yummy/core/error/failure.dart';
import 'package:yummy/features/app_colors/data/models/colors_model.dart';

import '../../../../core/usecase/usecase.dart';

class CalculateColorSet implements UseCase<ColorsModel, CalculateColorSetParams> {
  @override
  Future<Either<Failure, ColorsModel>> call(
    CalculateColorSetParams params,
  ) async {
    final midLight = Color.lerp(params.mainLight, params.mainDark, 0.382);
    final midDark = Color.lerp(params.mainLight, params.mainDark, 0.618);

    final midColor = Color.lerp(params.mainLight, params.mainDark, 0.5);
    final actInfo = Color.lerp(Colors.blue, midColor, 0.214);
    final actSuccess = Color.lerp(Colors.green, midColor, 0.214);
    final actWrong = Color.lerp(Colors.red, midColor, 0.214);

    if (midLight == null ||
        midDark == null ||
        actInfo == null ||
        actSuccess == null ||
        actWrong == null
    ) {
      return const Left(LocalFailure("Colors calculating is wrong."));
    }

    return Right(ColorsModel(
      name: params.name,
      created: DateTime.now(),

      mainLight: params.mainLight,
      midLight: midLight,
      midDark: midDark,
      mainDark: params.mainDark,

      actInfo: actInfo,
      actSuccess: actSuccess,
      actWrong: actWrong,
    ));
  }
}

class CalculateColorSetParams extends Equatable {
  final String name;
  final Color mainLight;
  final Color mainDark;

  const CalculateColorSetParams({
    required this.name,
    required this.mainLight,
    required this.mainDark,
  });

  @override
  List<Object?> get props => [name, mainLight, mainDark];
}
