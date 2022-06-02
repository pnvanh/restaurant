import 'package:equatable/equatable.dart';

class CategiryEntity extends Equatable {
  String? alias;
  String? title;

  CategiryEntity({
    this.alias,
    this.title,
  }) : super();

  toJson() {}

  @override
  List<Object> get props => [
        alias ?? '',
        title ?? '',
      ];
}
