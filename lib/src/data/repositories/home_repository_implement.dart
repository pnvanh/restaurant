import 'package:dartz/dartz.dart';
import 'package:restaurant/src/core/errror/exception.dart';
import 'package:restaurant/src/core/errror/failure.dart';
import 'package:restaurant/src/core/network/network_info.dart';
import 'package:restaurant/src/datasources/remote/home_remote_datasource.dart';
import 'package:restaurant/src/platform/entities/banner_entity.dart';
import 'package:restaurant/src/platform/entities/food_entity.dart';
import 'package:restaurant/src/platform/entities/restaurant_entity.dart';
import 'package:restaurant/src/platform/repositories/home_repository.dart';

class FetchHomeBannerFailure extends Failure {
  final String message;
  FetchHomeBannerFailure(this.message);
}

class FetchListNewFoodFailure extends Failure {
  final String message;
  FetchListNewFoodFailure(this.message);
}

class HomeRepositoryImplement extends HomeRepository {
  final HomeRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  HomeRepositoryImplement({
    required this.remoteDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<BannerEntity>>> fetchHomeBanners() async {
    if (await networkInfo.isConnected) {
      try {
        final banners = await remoteDatasource.fetchHomeBanners();
        return Right(banners);
      } on ServerException catch (error) {
        return Left(FetchHomeBannerFailure(error.message));
      }
    } else {
      return Left(FetchHomeBannerFailure('Netword unavailable!'));
    }
  }

  @override
  Future<Either<Failure, List<FoodEntity>>> fetchListNewFood() async {
    if (await networkInfo.isConnected) {
      try {
        final listNewFood = await remoteDatasource.fetchListNewFoods();
        return Right(listNewFood);
      } on ServerException catch (error) {
        return Left(FetchListNewFoodFailure(error.message));
      }
    } else {
      return Left(FetchListNewFoodFailure('Netword unavailable!'));
    }
  }

  @override
  Future<Either<Failure, List<RestaurantEntity>>> fetchListRestaurants() async {
    if (await networkInfo.isConnected) {
      try {
        final listRestaurants = await remoteDatasource.fetchListRestaurants();
        return Right(listRestaurants);
      } on ServerException catch (error) {
        return Left(FetchListNewFoodFailure(error.message));
      }
    } else {
      return Left(FetchListNewFoodFailure('Netword unavailable!'));
    }
  }
}
