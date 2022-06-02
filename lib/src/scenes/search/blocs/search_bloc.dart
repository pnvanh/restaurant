import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/src/core/usecase/usecase.dart';
import 'package:restaurant/src/platform/entities/business_entity.dart';
import 'package:restaurant/src/platform/usecase/business_usecase.dart';
import 'package:restaurant/src/scenes/search/blocs/search_event.dart';
import 'package:restaurant/src/scenes/search/blocs/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required BusinessUsecase businessUsecase})
      : this.businessUsecase = businessUsecase,
        super(SearchInitial());

  final BusinessUsecase businessUsecase;

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is LocationLoading) {
      yield* mapLoadingLocationToState(event, state);
    }

    if (event is LocationLoaded) {
      yield* mapBusinessRestaurantsToState(event, state);
    }
  }

  Stream<SearchState> mapLoadingLocationToState(
      LocationLoading event, SearchState state) async* {
    yield state.copyWith(location: state.location);
    // try {
    //   print("State: ${state.location}");
    //   final result = await businessUsecase.call(
    //     BusinessRestaurantParams(
    //       state.location?.latitude ?? 0,
    //       state.location?.longitude ?? 0,
    //     ),
    //   );

    //   if (result.isRight()) {
    //     final List<BusinessEntity>? restaurants = result.getOrElse(() => []);

    //     yield ListBusinessRestaurantsSuccess(restaurants: restaurants);
    //   }
    // } on ListBusinessRestaurantsFailure catch (error) {
    //   yield ListBusinessRestaurantsFailure(message: '$error');
    // }
  }

  Stream<SearchState> mapBusinessRestaurantsToState(
      LocationLoaded event, SearchState state) async* {
    yield state.copyWith(location: state.location);
    try {
      print("State: ${state.location}");
      final result = await businessUsecase.call(
        BusinessRestaurantParams(
          state.location?.latitude ?? 0,
          state.location?.longitude ?? 0,
        ),
      );

      if (result.isRight()) {
        final List<BusinessEntity>? restaurants = result.getOrElse(() => []);

        yield ListBusinessRestaurantsSuccess(restaurants: restaurants);
      }
    } on ListBusinessRestaurantsFailure catch (error) {
      yield ListBusinessRestaurantsFailure(message: '$error');
    }
  }
}
