import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  String? address;
  String? city;
  String? zipCode;
  String? country;
  String? state;
  // List<String>? display;

  LocationEntity({
    this.address,
    this.city,
    this.zipCode,
    this.country,
    this.state,
    // this.display,
  }) : super();

  toJson() {}

  @override
  List<Object> get props => [
        address ?? '',
        city ?? '',
        zipCode ?? '',
        country ?? '',
        state ?? '',
        // display ?? [],
      ];
}
