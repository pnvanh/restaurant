import 'package:restaurant/src/core/errror/error.dart';
import 'package:restaurant/src/data/models/banner_model.dart';
import 'package:restaurant/src/services/api/app/api_url.dart';
import 'package:restaurant/src/services/api/core/api_base_input.dart';
import 'package:restaurant/src/services/api/core/api_base_output.dart';
import 'package:restaurant/src/services/api/core/api_service.dart';

extension APIHome on APIService {
  Future<HomeBannerOutput> fetchHomeBanners(HomeBannerInput input) async {
    try {
      APIBaseOutput dataJson = await requestGet(input);
      return HomeBannerOutput(dataJson.json);
    } on ServerException catch (error) {
      throw ServerException(error.message);
    }
  }
}

class HomeBannerInput extends APIBaseInput {
  HomeBannerInput() : super(url: APIUrl.banners, body: {});
}

class HomeBannerOutput extends APIBaseOutput {
  List<BannerModel>? banners;

  HomeBannerOutput(Map<String, dynamic> json) : super(json);

  @override
  mapping(Map<String, dynamic> json) {
    super.mapping(json);
    print("JSON => $json");

    var genreBannersFromJson = json['result'] as List;
    List<BannerModel> result =
        genreBannersFromJson.map((e) => BannerModel.fromJson(e)).toList();

    banners = result;
  }
}
