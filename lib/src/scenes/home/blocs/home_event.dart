import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeBannerRequested extends HomeEvent {}

class HomeListNewFoodsRequested extends HomeEvent {}
