import 'package:restaurant/src/platform/entities/history_entity.dart';

class HistoryModel extends HistoryEntity {
  HistoryModel({
    required int id,
    String? name,
    String? restaurant,
    String? location,
    String? imageUrl,
  }) : super(
          id: id,
          name: name,
          restaurant: restaurant,
          location: location,
          imageUrl: imageUrl,
        );

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json["id"] as int,
      name: json["name"] as String,
      restaurant: json["restaurant"] as String,
      location: json["location"] as String,
      imageUrl: json["imageUrl"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'restaurant': restaurant,
      'location': location,
      'imageUrl': imageUrl,
    };
  }

  HistoryModel copyWithModel({
    int? id,
    String? name,
    String? restaurant,
    String? location,
    String? imageUrl,
  }) {
    return HistoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      restaurant: restaurant ?? this.restaurant,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
