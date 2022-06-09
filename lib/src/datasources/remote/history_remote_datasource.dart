import 'package:restaurant/src/core/errror/error.dart';
import 'package:restaurant/src/platform/entities/banner_entity.dart';
import 'package:restaurant/src/platform/entities/food_entity.dart';
import 'package:restaurant/src/platform/entities/history_entity.dart';
import 'package:restaurant/src/platform/entities/restaurant_entity.dart';
import 'package:restaurant/src/services/api/app/api_history.dart';
import 'package:restaurant/src/services/api/app/api_home.dart';
import 'package:restaurant/src/services/api/core/api_service.dart';

abstract class HitoryRemoteDatasource {
  Future<List<HistoryEntity>> fetchHistories();
}

class HistoryRemoteDatasourceImplement extends HitoryRemoteDatasource {
  @override
  Future<List<RestaurantEntity>> fetchListRestaurants() async {
    final input = RestaurantListInput();
    final output = await APIService.shared.fetchListRestaurant(input);

    try {
      if (output.restaurants != null) {
        return output.restaurants ?? [];
      } else {
        throw ServerException(output.errorMessage);
      }
    } on ServerException catch (error) {
      throw ServerException(error.message);
    }
  }

  @override
  Future<List<HistoryEntity>> fetchHistories() async {
    final input = HistoryInput();
    final output = await APIService.shared.fetchHistoryes(input);

    try {
      if (output.histories != null) {
        return output.histories ?? [];
      } else {
        throw ServerException(output.errorMessage);
      }
    } on ServerException catch (error) {
      throw ServerException(error.message);
    }
  }
}
