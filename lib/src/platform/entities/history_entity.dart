import 'package:equatable/equatable.dart';

class HistoryEntity extends Equatable {
  final int id;
  String? name;
  String? restaurant;
  String? imageUrl;
  String? location;

  HistoryEntity({
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
