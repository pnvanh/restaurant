// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class APIBaseInput extends Equatable {
  final String url;
  final Map<String, dynamic>? urlParams;
  final Map<String, dynamic>? body;
  Map<String, String>? headers;

  APIBaseInput({required String url, this.urlParams, this.body, this.headers})
      : this.url = url;

  @override
  List<dynamic> get props => [url, urlParams ?? {}, body ?? {}];
}
