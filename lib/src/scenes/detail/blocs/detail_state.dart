import 'package:equatable/equatable.dart';
import 'package:restaurant/src/platform/entities/restaurant_entity.dart';

class DetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class OtherRestaurantListSuccess extends DetailState {
  List<RestaurantEntity>? restaurants;

  OtherRestaurantListSuccess({
    this.restaurants,
  });

  @override
  List<Object> get props => [
        restaurants ?? [],
      ];

  List<RestaurantEntity> get listRestaurants {
    if (restaurants == null) {
      return [];
    }
    return restaurants!;
  }
}

class OtherRestaurantListFailure extends DetailState {
  String message;
  OtherRestaurantListFailure(this.message);

  @override
  List<Object> get props => [message];
}
