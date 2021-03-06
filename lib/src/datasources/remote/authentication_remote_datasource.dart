import 'package:restaurant/src/core/errror/error.dart';
import 'package:restaurant/src/datasources/local/authentication_local_datasource.dart';
import 'package:restaurant/src/services/api/app/api_authentication.dart';
import 'package:restaurant/src/services/api/core/api_service.dart';

abstract class AuthenticationRemoteDatasource {
  Future<String> signInByEmail(String email, String password);
}

class AuthenticationRemoteDatasourceImplement
    extends AuthenticationRemoteDatasource {
  @override
  Future<String> signInByEmail(String email, String password) async {
    try {
      final input = LoginInput(email, password);
      final output = await APIService.shared.performSignInByEmail(input);
      final String? token;

      if (output.success) {
        token = output.token ?? "";
        AuthenticationLocalDatasourceImplement.shared.saveAccessToken(token);
        return token;
      } else {
        throw ServerException(output.errorMessage);
      }
    } on ServerException catch (error) {
      throw ServerException(error.message);
    }
  }
}
