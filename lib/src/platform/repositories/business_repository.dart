import 'package:dartz/dartz.dart';
import 'package:restaurant/src/core/errror/failure.dart';
import 'package:restaurant/src/platform/entities/business_entity.dart';

abstract class BusinessRepository {
  Future<Either<Failure, List<BusinessEntity>>> fetchBusinessRestaurants(
    double latitude,
    double longitude,
  );
}
