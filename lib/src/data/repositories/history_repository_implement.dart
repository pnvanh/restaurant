import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:restaurant/src/core/errror/exception.dart';
import 'package:restaurant/src/core/errror/failure.dart';
import 'package:restaurant/src/core/network/network_info.dart';
import 'package:restaurant/src/datasources/remote/history_remote_datasource.dart';
import 'package:restaurant/src/platform/entities/history_entity.dart';
import 'package:restaurant/src/platform/repositories/history_repository.dart';

class FetchFetchHistoryFailure extends Failure {
  final String message;
  FetchFetchHistoryFailure(this.message);
}

class HistoryRepositoryImplement extends HistoryRepository {
  final HitoryRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  HistoryRepositoryImplement({
    required this.remoteDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<HistoryEntity>>> fetchHistories() async {
    if (await networkInfo.isConnected) {
      try {
        final listRestaurants = await remoteDatasource.fetchHistories();
        return Right(listRestaurants);
      } on ServerException catch (error) {
        return Left(FetchFetchHistoryFailure(error.message));
      }
    } else {
      return Left(FetchFetchHistoryFailure('Netword unavailable!'));
    }
  }
}
