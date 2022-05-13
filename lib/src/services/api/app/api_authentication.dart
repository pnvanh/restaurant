import 'package:restaurant/src/core/errror/exception.dart';
import 'package:restaurant/src/services/api/app/api_url.dart';
import 'package:restaurant/src/services/api/core/api_base_input.dart';
import 'package:restaurant/src/services/api/core/api_base_output.dart';
import 'package:restaurant/src/services/api/core/api_service.dart';

extension APILogin on APIService {
  Future<LoginOutput> performSignInByEmail(LoginInput input) async {
    try {
      APIBaseOutput dataJson = await requestPost(input);
      return LoginOutput(dataJson.json);
    } on ServerException catch (error) {
      throw ServerException(error.message);
    }
  }
}

class LoginInput extends APIBaseInput {
  final String email;
  final String password;

  LoginInput(this.email, this.password)
      : super(url: APIUrl.login, body: {"email": email, "password": password});
}

class LoginOutput extends APIBaseOutput {
  String? token;

  LoginOutput(Map<String, dynamic> json) : super(json);

  @override
  mapping(Map<String, dynamic> json) {
    print("JSON => $json");
    super.mapping(json);
    token = json['access_token'] as String;
  }
}
