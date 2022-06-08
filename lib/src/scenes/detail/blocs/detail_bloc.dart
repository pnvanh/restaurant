import 'package:bloc/bloc.dart';
import 'package:restaurant/src/platform/entities/restaurant_entity.dart';
import 'package:restaurant/src/platform/repositories/home_repository.dart';
import 'package:restaurant/src/scenes/detail/blocs/bloc.dart';
import 'package:restaurant/src/scenes/home/blocs/bloc.dart';

class OtherRestaurantListBloc extends Bloc<DetailEvent, DetailState> {
  OtherRestaurantListBloc({required HomeRepository repository})
      : this.repository = repository,
        super(DetailInitial());

  final HomeRepository repository;

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is OtherRestaurantsListRequested) {
      yield* mapListOrtherRestaurantRequestedToSate(event);
    }
  }

  Stream<DetailState> mapListOrtherRestaurantRequestedToSate(
      OtherRestaurantsListRequested event) async* {
    try {
      final results = await repository.fetchListRestaurants();

      if (results.isRight()) {
        final List<RestaurantEntity>? restaurants = results.getOrElse(() => []);
        yield OtherRestaurantListSuccess(restaurants: restaurants);
      }
    } on HomeNewListFailure catch (error) {
      yield OtherRestaurantListFailure('message: $error');
    }
  }
}
