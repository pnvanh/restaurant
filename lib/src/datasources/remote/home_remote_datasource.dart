import 'package:restaurant/src/core/errror/error.dart';
import 'package:restaurant/src/data/models/banner_model.dart';
import 'package:restaurant/src/services/api/app/api_home.dart';
import 'package:restaurant/src/services/api/core/api_service.dart';

abstract class HomeRemoteDatasource {
  Future<List<BannerModel>> fetchHomeBanners();
}

class HomeRemoteDatasourceImplement extends HomeRemoteDatasource {
  @override
  Future<List<BannerModel>> fetchHomeBanners() async {
    final input = HomeBannerInput();
    final output = await APIService.shared.fetchHomeBanners(input);
    try {
      if (output.banners != null) {
        return output.banners ?? [];
      } else {
        throw ServerException(output.errorMessage);
      }
    } on ServerException catch (error) {
      throw ServerException(error.message);
    }
  }
}
