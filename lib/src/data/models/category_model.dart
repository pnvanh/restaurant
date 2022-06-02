import 'package:restaurant/src/platform/entities/category_entity.dart';

class CategiryModel extends CategiryEntity {
  CategiryModel({
    String? alias,
    String? title,
  }) : super(
          alias: alias,
          title: title,
        );

  factory CategiryModel.fromJson(Map<String, dynamic> json) {
    return CategiryModel(
      alias: json["alias"] as String,
      title: json["title"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'alias': alias,
      'title': title,
    };
  }

  CategiryModel copyWithModel({
    String? alias,
    String? title,
  }) {
    return CategiryModel(
      alias: alias ?? this.alias,
      title: title ?? this.title,
    );
  }
}
