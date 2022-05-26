import 'package:dartz/dartz.dart';
import 'package:restaurant/src/core/errror/error.dart';
import 'package:restaurant/src/data/models/banner_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BannerModel>>> fetchHomeBanners();
}
