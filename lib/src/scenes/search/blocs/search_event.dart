import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<dynamic?> get props => [];
}

// class ListBusinessRestaurantsRequested extends SearchEvent {}

class LocationLoading extends SearchEvent {}

class LocationLoaded extends SearchEvent {
  final LatLng location;

  const LocationLoaded(this.location);

  @override
  List<dynamic?> get props => [LatLng];
}

class GeolocationError extends SearchEvent {}
