import 'package:equatable/equatable.dart';

class RestaurantEntity extends Equatable {
  final int id;
  String? name;
  String? restaurant;
  String? imageUrl;
  String? location;

  RestaurantEntity({
    required this.id,
    this.name,
    this.restaurant,
    this.imageUrl,
    this.location,
  }) : super();

  toJson() {}

  @override
  List<Object> get props => [
        id,
        name ?? '',
        restaurant ?? '',
        imageUrl ?? '',
        location ?? '',
      ];
}
