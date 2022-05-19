import 'package:restaurant/src/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthenticationLocalDatasource {
  Future<void> saveAccessToken(String accessToken);
  Future<String> getAccessToken();
  Future<void> removeAccessToken();
}

class AuthenticationLocalDatasourceImplement
    extends AuthenticationLocalDatasource {
  static final shared = AuthenticationLocalDatasourceImplement();

  @override
  Future<void> saveAccessToken(String accessToken) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(ACCESS_TOKEN, accessToken);
    sharedPreferences.setBool(IS_LOGGER, true);
  }

  @override
  Future<String> getAccessToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonString = sharedPreferences.getString(ACCESS_TOKEN);
    return jsonString ?? '';
  }

  @override
  Future<void> removeAccessToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(ACCESS_TOKEN, '');
  }
}
