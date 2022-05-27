import 'package:equatable/equatable.dart';
import 'package:restaurant/src/data/models/banner_model.dart';
import 'package:restaurant/src/platform/entities/banner_entity.dart';
import 'package:restaurant/src/platform/entities/food_entity.dart';
import 'package:restaurant/src/platform/entities/restaurant_entity.dart';

class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeNewListSuccess extends HomeState {
  List<BannerEntity>? banners;
  List<FoodEntity>? foods;
  List<RestaurantEntity>? restaurants;

  HomeNewListSuccess({
    this.banners,
    this.foods,
    this.restaurants,
  });

  @override
  List<Object> get props => [
        banners ?? [],
        foods ?? [],
        restaurants ?? [],
      ];

  List<BannerEntity> get listBanners {
    if (banners == null) {
      return [];
    }
    return banners!;
  }

  List<FoodEntity> get listFoods {
    if (foods == null) {
      return [];
    }
    return foods!;
  }

  List<RestaurantEntity> get listRestaurants {
    if (restaurants == null) {
      return [];
    }
    return restaurants!;
  }
}

class HomeNewListFailure extends HomeState {
  String message;
  HomeNewListFailure(this.message);

  @override
  List<Object> get props => [message];
}
