import 'package:restaurant/src/platform/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    String? address,
    String? city,
    String? zipCode,
    String? country,
    String? state,
    // List<String>? display,
  }) : super(
          address: address,
          city: city,
          zipCode: zipCode,
          country: country,
          state: state,
          // display: display,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      address: json["address1"] as String,
      city: json["city"] as String,
      zipCode: json["zip_code"] as String,
      country: json["country"] as String,
      state: json["state"] as String,
      // display: json["display_address"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address1': address,
      'city': city,
      'zip_code': zipCode,
      'country': country,
      'state': state,
      // 'display_address': display,
    };
  }

  LocationModel copyWithModel({
    String? address,
    String? city,
    String? zipCode,
    String? country,
    String? state,
    List<String>? display,
  }) {
    return LocationModel(
      address: address ?? this.address,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      state: state ?? this.state,
      // display: display ?? this.display,
    );
  }
}
