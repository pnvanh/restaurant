import 'package:restaurant/src/platform/entities/coordinates_entity.dart';

class CoordinateModel extends CoordinateEntity {
  CoordinateModel({
    double? latitude,
    double? longitude,
  }) : super(
          latitude: latitude,
          longitude: longitude,
        );

  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(
      latitude: json["latitude"] as double,
      longitude: json["longitude"] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  CoordinateModel copyWithModel({
    double? latitude,
    double? longitude,
  }) {
    return CoordinateModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
