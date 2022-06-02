// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant/src/core/errror/exception.dart';
import 'package:restaurant/src/datasources/local/authentication_local_datasource.dart';
import 'package:restaurant/src/services/api/core/api_base_input.dart';
import 'package:restaurant/src/services/api/core/api_base_output.dart';

class APIService<T> {
  static final shared = APIService();

  final client = http.Client();

  generateBusinessHeader() async {
    var headers = {'Content-Type': 'application/json'};
    var apiKey = dotenv.env['API_KEY'];

    if (apiKey != '') {
      headers['Authorization'] = 'Bearer $apiKey';
    }
    return headers;
  }

  generateHeader() async {
    var headers = {'Content-Type': 'application/json'};
    final idToken =
        await AuthenticationLocalDatasourceImplement.shared.getAccessToken();
    if (idToken != '') {
      headers['Authorization'] = 'Bearer $idToken';
    }
    return headers;
  }

  Future<APIBaseOutput> requestGet(APIBaseInput input) async {
    try {
      final headers;
      if (input.headers != null) {
        headers = await generateBusinessHeader();
        if (input.headers != null) {
          input.headers!.addAll(headers);
        } else {
          input.headers = headers;
        }
      }

      print('URL: ${input.url}');
      print('===REQUEST===');
      print('URL: ${input.url}');
      print('Params: ${input.urlParams}');
      print('Method: GET');
      print('Body: ${input.body}');
      print('Headers: ${input.headers}');

      final response = await client.get(
          Uri.parse(input.url).replace(queryParameters: input.urlParams),
          headers: input.headers);
      final json = jsonDecode(response.body) as Map<String, dynamic>;

      print('===RESPONSE===');
      print('Status code: ${response.statusCode}');
      print(json);

      return APIBaseOutput(json);
    } catch (error) {
      print('Error: ${error.toString()}');
      throw ServerException('API: GET FAILURE!');
    }
  }

  Future<APIBaseOutput> requestPost(APIBaseInput input) async {
    try {
      print('URL: ${input.url}');
      print('===REQUEST===');
      print('URL: ${input.url}');
      print('Method: POST');
      print('Body: ${input.body}');
      print('Headers: ${input.headers}');
      print('===RESPONSE===');

      final response = await client.post(Uri.parse(input.url),
          headers: input.headers, body: input.body);
      print('Body: ${response.body}');
      final json = jsonDecode(response.body) as Map<String, dynamic>;

      print('Status code: ${response.statusCode}');
      print(json);

      if (json["status"]) {
        return APIBaseOutput(json);
      } else {
        throw ServerException(json["message"]);
      }
    } catch (error) {
      throw ServerException('API: POST FAILURE!');
    }
  }

  // TODOs: Get json from local
  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }
}
