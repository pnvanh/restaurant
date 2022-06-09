import 'package:restaurant/src/core/errror/exception.dart';
import 'package:restaurant/src/data/models/history_model.dart';
import 'package:restaurant/src/platform/entities/history_entity.dart';
import 'package:restaurant/src/services/api/app/api_url.dart';
import 'package:restaurant/src/services/api/core/api_base_input.dart';
import 'package:restaurant/src/services/api/core/api_base_output.dart';
import 'package:restaurant/src/services/api/core/api_service.dart';

extension APIHistory on APIService {
  Future<HistoryOutput> fetchHistoryes(HistoryInput input) async {
    try {
      APIBaseOutput dataJson = await requestGet(input);
      return HistoryOutput(dataJson.json);
    } on ServerException catch (error) {
      throw ServerException(error.message);
    }
  }
}

class HistoryInput extends APIBaseInput {
  HistoryInput()
      : super(
          url: APIUrl.history,
        );
}

class HistoryOutput extends APIBaseOutput {
  List<HistoryEntity>? histories;

  HistoryOutput(Map<String, dynamic> json) : super(json);

  @override
  mapping(Map<String, dynamic> json) {
    super.mapping(json);
    print("JSON => $json");

    var genreHistoriesListFromJson = json['result'] as List;
    List<HistoryEntity> result = genreHistoriesListFromJson
        .map((e) => HistoryModel.fromJson(e))
        .toList();

    histories = result;
  }
}
