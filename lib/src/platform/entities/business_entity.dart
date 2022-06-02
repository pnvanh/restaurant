import 'package:equatable/equatable.dart';
import 'package:restaurant/src/data/models/category_model.dart';
import 'package:restaurant/src/data/models/coordinate_model.dart';
import 'package:restaurant/src/data/models/location_model.dart';

class BusinessEntity extends Equatable {
  final String id;
  String? alias;
  String? name;
  String? imageUrl;
  String? url;
  int? reviewCount;
  List<CategiryModel>? categories;
  double? rating;
  String? price;
  CoordinateModel? coordinates;
  LocationModel? location;
  String? phone;
  String? phoneDisplay;
  double? distance;

  BusinessEntity({
    required this.id,
    this.alias,
    this.name,
    this.imageUrl,
    this.url,
    this.reviewCount,
    this.categories,
    this.rating,
    this.price,
    this.coordinates,
    this.location,
    this.phone,
    this.phoneDisplay,
    this.distance,
  }) : super();

  toJson() {}

  @override
  List<Object> get props => [
        id,
        name ?? '',
        imageUrl ?? '',
        url ?? '',
        reviewCount ?? 0,
        categories ?? [],
        rating ?? 0,
        price ?? '',
        coordinates ?? '',
        location ?? '',
        phone ?? '',
        phoneDisplay ?? '',
        distance ?? 0
      ];
}
