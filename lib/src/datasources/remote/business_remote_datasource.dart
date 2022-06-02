import 'dart:ffi';

import 'package:restaurant/src/core/errror/exception.dart';
import 'package:restaurant/src/platform/entities/business_entity.dart';
import 'package:restaurant/src/services/api/app/api_business.dart';
import 'package:restaurant/src/services/api/core/api_service.dart';

abstract class BusinessRemoteDatasource {
  Future<List<BusinessEntity>> fetchBusinessRestaurants(
      double latitude, double longitude);
}

class BusinessRemoteDatasourceImplement extends BusinessRemoteDatasource {
  @override
  Future<List<BusinessEntity>> fetchBusinessRestaurants(
      double latitude, double longitude) async {
    try {
      final input = BusinessInput(latitude, longitude);
      final output = await APIService.shared.fetchBusinessesList(input);
      if (output.restaurants != null) {
        print(output.restaurants);
        return output.restaurants ?? [];
      } else {
        throw ServerException(output.errorMessage);
      }
    } on ServerException catch (error) {
      throw ServerException(error.message);
    }
  }
}
