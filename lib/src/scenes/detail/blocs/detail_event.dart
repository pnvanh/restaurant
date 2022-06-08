import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OtherRestaurantsListRequested extends DetailEvent {}
