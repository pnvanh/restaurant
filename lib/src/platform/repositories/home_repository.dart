import 'package:dartz/dartz.dart';
import 'package:restaurant/src/core/errror/error.dart';
import 'package:restaurant/src/platform/entities/banner_entity.dart';
import 'package:restaurant/src/platform/entities/food_entity.dart';
import 'package:restaurant/src/platform/entities/restaurant_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BannerEntity>>> fetchHomeBanners();
  Future<Either<Failure, List<FoodEntity>>> fetchListNewFood();
  Future<Either<Failure, List<RestaurantEntity>>> fetchListRestaurants();
}
