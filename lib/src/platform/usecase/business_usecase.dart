import 'package:dartz/dartz.dart';

import 'package:restaurant/src/core/errror/failure.dart';
import 'package:restaurant/src/core/usecase/usecase.dart';
import 'package:restaurant/src/platform/entities/business_entity.dart';
import 'package:restaurant/src/platform/repositories/business_repository.dart';

class BusinessRestaurantParams extends Params {
  final double latitude;
  final double longitude;

  const BusinessRestaurantParams(this.latitude, this.longitude);
}

class BusinessUsecase
    extends UseCase<List<BusinessEntity>?, BusinessRestaurantParams> {
  final BusinessRepository repository;

  BusinessUsecase({required this.repository});

  @override
  Future<Either<Failure, List<BusinessEntity>?>> call(
      BusinessRestaurantParams params) async {
    return await repository.fetchBusinessRestaurants(
      params.latitude,
      params.longitude,
    );
  }
}
