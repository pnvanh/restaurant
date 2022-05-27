import 'package:bloc/bloc.dart';
import 'package:restaurant/src/core/errror/failure.dart';
import 'package:restaurant/src/data/models/banner_model.dart';
import 'package:restaurant/src/platform/entities/banner_entity.dart';
import 'package:restaurant/src/platform/entities/food_entity.dart';
import 'package:restaurant/src/platform/entities/restaurant_entity.dart';
import 'package:restaurant/src/platform/repositories/home_repository.dart';
import 'package:restaurant/src/scenes/home/blocs/bloc.dart';

class HomeBannerBloc extends Bloc<HomeEvent, HomeState> {
  HomeBannerBloc({required HomeRepository repository})
      : this.repository = repository,
        super(HomeInitial());

  final HomeRepository repository;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeBannerRequested) {
      yield* mapListBannersRequestedToState(event);
    }

    if (event is HomeListNewFoodsRequested) {
      yield* mapListNewFoodsRequestedToSate(event);
    }
  }

  Stream<HomeState> mapListBannersRequestedToState(
      HomeBannerRequested event) async* {
    try {
      final result = await repository.fetchHomeBanners();
      if (result.isRight() == true) {
        final List<BannerEntity>? banners = result.getOrElse(() => []);

        yield HomeNewListSuccess(banners: banners);
      }
    } on HomeNewListFailure catch (error) {
      yield HomeNewListFailure('HomeNewListFailure $error');
    }
  }

  Stream<HomeState> mapListNewFoodsRequestedToSate(
      HomeListNewFoodsRequested event) async* {
    try {
      final results = await repository.fetchListNewFood();

      if (results.isRight()) {
        final List<FoodEntity>? foods = results.getOrElse(() => []);
        yield HomeNewListSuccess(foods: foods);
      }
    } on HomeNewListFailure catch (error) {
      yield HomeNewListFailure('message: $error');
    }
  }
}

class HomeNewBloc extends Bloc<HomeEvent, HomeState> {
  HomeNewBloc({required HomeRepository repository})
      : this.repository = repository,
        super(HomeInitial());

  final HomeRepository repository;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeListNewFoodsRequested) {
      yield* mapListNewFoodsRequestedToSate(event);
    }
  }

  Stream<HomeState> mapListNewFoodsRequestedToSate(
      HomeListNewFoodsRequested event) async* {
    try {
      final results = await repository.fetchListNewFood();

      if (results.isRight()) {
        final List<FoodEntity>? foods = results.getOrElse(() => []);
        yield HomeNewListSuccess(foods: foods);
      }
    } on HomeNewListFailure catch (error) {
      yield HomeNewListFailure('message: $error');
    }
  }
}

class HomeRestaurantListBloc extends Bloc<HomeEvent, HomeState> {
  HomeRestaurantListBloc({required HomeRepository repository})
      : this.repository = repository,
        super(HomeInitial());

  final HomeRepository repository;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeListRestaurantsRequested) {
      yield* mapListRestaurantRequestedToSate(event);
    }
  }

  Stream<HomeState> mapListRestaurantRequestedToSate(
      HomeListRestaurantsRequested event) async* {
    try {
      final results = await repository.fetchListRestaurants();

      if (results.isRight()) {
        final List<RestaurantEntity>? restaurants = results.getOrElse(() => []);
        yield HomeNewListSuccess(restaurants: restaurants);
      }
    } on HomeNewListFailure catch (error) {
      yield HomeNewListFailure('message: $error');
    }
  }
}
