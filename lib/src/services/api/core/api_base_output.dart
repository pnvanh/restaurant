class APIBaseOutput {
  final Map<String, Object> json;

  APIBaseOutput(this.json) : super() {
    mapping(json);
  }

  mapping(Map<String, Object> json) {}
  //fixme
  String get errorMessage => json['message'] as String;
  //fixme
  bool get success => json['ok'] as bool;
}
