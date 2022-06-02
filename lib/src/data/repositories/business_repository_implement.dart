import 'dart:async';
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:restaurant/src/core/errror/exception.dart';
import 'package:restaurant/src/core/errror/failure.dart';
import 'package:restaurant/src/core/network/network_info.dart';
import 'package:restaurant/src/datasources/remote/business_remote_datasource.dart';
import 'package:restaurant/src/platform/entities/business_entity.dart';
import 'package:restaurant/src/platform/repositories/business_repository.dart';

class FetchBusinessRestaurantFailure extends Failure {
  final String message;
  const FetchBusinessRestaurantFailure(this.message);
}

class BusinessRepositoryImplement extends BusinessRepository {
  final NetworkInfoImplement networkInfo;
  final BusinessRemoteDatasourceImplement remoteDatasource;
  final controller = StreamController<String?>();

  BusinessRepositoryImplement({
    required this.remoteDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<BusinessEntity>>> fetchBusinessRestaurants(
      double latitude, double longitude) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDatasource.fetchBusinessRestaurants(
            latitude, longitude);

        print(result.length);
        return Right(result);
      } on ServerException catch (error) {
        print(error);
        return Left(FetchBusinessRestaurantFailure(error.message));
      } catch (error) {
        print(error);
        return Left(FetchBusinessRestaurantFailure(error.toString()));
      }
    } else {
      //-TODO: get cache user
      return Left(FetchBusinessRestaurantFailure('Failure!'));
    }
  }
}
