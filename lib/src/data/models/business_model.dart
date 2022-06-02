import 'package:restaurant/src/data/models/category_model.dart';
import 'package:restaurant/src/data/models/coordinate_model.dart';
import 'package:restaurant/src/data/models/location_model.dart';
import 'package:restaurant/src/platform/entities/business_entity.dart';

class BusinessModel extends BusinessEntity {
  BusinessModel({
    required String id,
    String? name,
    String? imageUrl,
    String? url,
    int? reviewCount,
    List<CategiryModel>? categories,
    double? rating,
    String? price,
    CoordinateModel? coordinates,
    LocationModel? location,
    String? phone,
    String? phoneDisplay,
    double? distance,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          url: url,
          reviewCount: reviewCount,
          categories: categories,
          rating: rating,
          price: price,
          coordinates: coordinates,
          location: location,
          phone: phone,
          phoneDisplay: phoneDisplay,
          distance: distance,
        );

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    var locationJson = json['location'];
    var coordinatesJson = json['coordinates'];
    var categoryJson = json['categories'] as List;

    List<CategiryModel> categories =
        categoryJson.map((i) => CategiryModel.fromJson(i)).toList();

    return BusinessModel(
      id: json["id"] as String,
      name: json["name"] as String,
      imageUrl: json["image_url"] as String,
      url: json["url"] as String,
      reviewCount: json["review_count"],
      categories: categories,
      rating: json["rating"] as double,
      price: json["price"] as String,
      coordinates: coordinatesJson != null
          ? CoordinateModel.fromJson(coordinatesJson)
          : null,
      location:
          locationJson != null ? LocationModel.fromJson(locationJson) : null,
      phone: json["phone"] as String,
      phoneDisplay: json["display_phone"] as String,
      distance: json["distance"] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': imageUrl,
      'url': url,
      'review_count': reviewCount,
      'categories': categories,
      'rating': imageUrl,
      'price': url,
      'coordinates': coordinates,
      'location': location,
      'phone': phone,
      'display_phone': phoneDisplay,
      'distance': distance,
    };
  }

  BusinessModel copyWithModel({
    String? id,
    String? name,
    String? imageUrl,
    String? url,
    int? reviewCount,
    List<CategiryModel>? categories,
    double? rating,
    String? price,
    CoordinateModel? coordinates,
    LocationModel? location,
    String? phone,
    String? phoneDisplay,
    double? distance,
  }) {
    return BusinessModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      url: url ?? this.url,
      reviewCount: reviewCount ?? this.reviewCount,
      categories: categories ?? this.categories,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      coordinates: coordinates ?? this.coordinates,
      location: location ?? this.location,
      phone: phone ?? this.phone,
      phoneDisplay: phoneDisplay ?? this.phoneDisplay,
      distance: distance ?? this.distance,
    );
  }
}
