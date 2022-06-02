import 'dart:ffi';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:restaurant/src/core/errror/exception.dart';
import 'package:restaurant/src/data/models/business_model.dart';
import 'package:restaurant/src/platform/entities/business_entity.dart';
import 'package:restaurant/src/services/api/app/api_authentication.dart';
import 'package:restaurant/src/services/api/app/api_url.dart';
import 'package:restaurant/src/services/api/core/api_base_input.dart';
import 'package:restaurant/src/services/api/core/api_base_output.dart';
import 'package:restaurant/src/services/api/core/api_service.dart';

extension APIDiscovery on APIService {
  Future<BusinessOutput> fetchBusinessesList(BusinessInput input) async {
    try {
      APIBaseOutput dataJson = await requestGet(input);
      return BusinessOutput(dataJson.json);
    } on ServerException catch (error) {
      throw ServerException(error.message);
    }
  }
}

class BusinessInput extends APIBaseInput {
  final double latitude;
  final double longitude;

  BusinessInput(this.latitude, this.longitude)
      : super(
          url: APIDiscoveryUrl.search,
          headers: {
            'Content-Type': 'application/json',
          },
          urlParams: {
            "latitude": "$latitude",
            "longitude": "$longitude",
          },
        );
}

class BusinessOutput extends APIBaseOutput {
  List<BusinessEntity>? restaurants;

  BusinessOutput(Map<String, dynamic> json) : super(json);

  @override
  mapping(Map<String, dynamic> json) {
    super.mapping(json);
    print("JSON => $json");

    var genreRestaurantListFromJson = json['businesses'] as List;
    List<BusinessEntity> result = genreRestaurantListFromJson
        .map((e) => BusinessModel.fromJson(e))
        .toList();

    restaurants = result;
  }
}
