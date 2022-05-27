import 'package:restaurant/src/core/errror/error.dart';
import 'package:restaurant/src/platform/entities/banner_entity.dart';
import 'package:restaurant/src/platform/entities/food_entity.dart';
import 'package:restaurant/src/platform/entities/restaurant_entity.dart';
import 'package:restaurant/src/services/api/app/api_home.dart';
import 'package:restaurant/src/services/api/core/api_service.dart';

abstract class HomeRemoteDatasource {
  Future<List<BannerEntity>> fetchHomeBanners();
  Future<List<FoodEntity>> fetchListNewFoods();
  Future<List<RestaurantEntity>> fetchListRestaurants();
}

class HomeRemoteDatasourceImplement extends HomeRemoteDatasource {
  @override
  Future<List<BannerEntity>> fetchHomeBanners() async {
    final input = HomeBannerInput();
    final output = await APIService.shared.fetchHomeBanners(input);
    try {
      if (output.banners != null) {
        return output.banners ?? [];
      } else {
        throw ServerException(output.errorMessage);
      }
    } on ServerException catch (error) {
      throw ServerException(error.message);
    }
  }

  @override
  Future<List<FoodEntity>> fetchListNewFoods() async {
    final input = HomeNewInput();
    final output = await APIService.shared.fetchListNewFood(input);

    try {
      if (output.foods != null) {
        return output.foods ?? [];
      } else {
        throw ServerException(output.errorMessage);
      }
    } on ServerException catch (error) {
      throw ServerException(error.message);
    }
  }

  @override
  Future<List<RestaurantEntity>> fetchListRestaurants() async {
    final input = RestaurantListInput();
    final output = await APIService.shared.fetchListRestaurant(input);

    try {
      if (output.restaurants != null) {
        return output.restaurants ?? [];
      } else {
        throw ServerException(output.errorMessage);
      }
    } on ServerException catch (error) {
      throw ServerException(error.message);
    }
  }
}
