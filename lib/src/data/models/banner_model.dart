import 'package:restaurant/src/platform/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  BannerModel({
    required int id,
    String? name,
    String? imageUrl,
    String? linkUrl,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          linkUrl: linkUrl,
        );

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json["id"] as int,
      name: json["name"] as String,
      imageUrl: json["imageUrl"] as String,
      linkUrl: json["linkUrl"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'linkUrl': linkUrl,
    };
  }

  BannerModel copyWithModel({
    int? id,
    String? name,
    String? imageUrl,
    String? linkUrl,
  }) {
    return BannerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      linkUrl: linkUrl ?? this.linkUrl,
    );
  }
}
