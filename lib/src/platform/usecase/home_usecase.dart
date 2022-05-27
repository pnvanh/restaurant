import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant/src/core/errror/failure.dart';
import 'package:restaurant/src/core/usecase/usecase.dart';
import 'package:restaurant/src/platform/entities/food_entity.dart';
import 'package:restaurant/src/platform/repositories/home_repository.dart';

class FetchNewFoodParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchNewFoodUsecase extends UseCase<List<FoodEntity>, Params> {
  final HomeRepository repository;

  FetchNewFoodUsecase({required this.repository});

  @override
  Future<Either<Failure, List<FoodEntity>>> call(Params params) async {
    return await repository.fetchListNewFood();
  }
}
