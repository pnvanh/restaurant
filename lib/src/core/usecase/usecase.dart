import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant/src/core/errror/failure.dart';

abstract class UseCase<Type, Params> {
  const UseCase();

  Future<Either<Failure, Type>> call(Params params);
}

class Params extends Equatable {
  const Params();

  @override
  List<Object> get props => [];
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object> get props => [];
}
