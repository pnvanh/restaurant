import 'package:equatable/equatable.dart';

class FoodEntity extends Equatable {
  final int id;
  String? name;
  String? restaurant;
  String? imageUrl;
  String? location;

  FoodEntity({
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
