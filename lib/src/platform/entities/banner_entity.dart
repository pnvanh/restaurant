import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final int id;
  String? name;
  String? imageUrl;
  String? linkUrl;

  BannerEntity({
    required this.id,
    this.name,
    this.imageUrl,
    this.linkUrl,
  }) : super();

  toJson() {}

  @override
  List<Object> get props => [
        id,
        name ?? '',
        imageUrl ?? '',
        linkUrl ?? '',
      ];
}
