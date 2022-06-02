import 'package:equatable/equatable.dart';

class CoordinateEntity extends Equatable {
  double? latitude;
  double? longitude;

  CoordinateEntity({
    this.latitude,
    this.longitude,
  }) : super();

  toJson() {}

  @override
  List<Object> get props => [
        latitude ?? 0,
        longitude ?? 0,
      ];
}
