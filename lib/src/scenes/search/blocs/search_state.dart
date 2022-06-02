import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/src/data/models/business_model.dart';
import 'package:restaurant/src/platform/entities/business_entity.dart';

class SearchState extends Equatable {
  List<BusinessEntity>? restaurants;
  LatLng? location;

  SearchState({this.location, this.restaurants});

  @override
  List<Object> get props => [];

  SearchState copyWith({
    LatLng? location,
  }) {
    return SearchState(
      location: location ?? this.location,
    );
  }
}

// ignore: must_be_immutable
class SearchInitial extends SearchState {}

// ignore: must_be_immutable
class ListBusinessRestaurantsSuccess extends SearchState {
  List<BusinessEntity>? restaurants;

  ListBusinessRestaurantsSuccess({
    this.restaurants,
  });

  @override
  List<Object> get props => [
        restaurants ?? [],
      ];

  List<BusinessEntity> get listRestaurants {
    if (listRestaurants == null) {
      return [];
    }
    return listRestaurants;
  }
}

// ignore: must_be_immutable
class ListBusinessRestaurantsFailure extends SearchState {
  String message;
  ListBusinessRestaurantsFailure({required this.message});

  @override
  List<Object> get props => [message];
}
