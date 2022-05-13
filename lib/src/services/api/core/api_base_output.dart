class APIBaseOutput {
  final Map<String, dynamic> json;

  APIBaseOutput(this.json) : super() {
    mapping(json);
  }

  mapping(Map<String, dynamic> json) {}
  String get errorMessage => json['message'] as String;
  bool get success => json['status'] as bool;
}
