import 'package:dartz/dartz.dart';
import 'package:yummy/core/error/failure.dart';

abstract class UseCase<RetType, Params> {
  Future<Either<Failure, RetType>> call(Params params);
}
