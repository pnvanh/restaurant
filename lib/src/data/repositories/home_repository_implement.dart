import 'package:dartz/dartz.dart';
import 'package:restaurant/src/core/errror/exception.dart';
import 'package:restaurant/src/core/errror/failure.dart';
import 'package:restaurant/src/core/network/network_info.dart';
import 'package:restaurant/src/data/models/banner_model.dart';
import 'package:restaurant/src/datasources/remote/home_remote_datasource.dart';
import 'package:restaurant/src/platform/repositories/home_repository.dart';

class FetchHomeBannerFailure extends Failure {
  final String message;
  FetchHomeBannerFailure(this.message);
}

class HomeRepositoryImplement extends HomeRepository {
  final HomeRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  HomeRepositoryImplement({
    required this.remoteDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<BannerModel>>> fetchHomeBanners() async {
    if (await networkInfo.isConnected) {
      try {
        final discovers = await remoteDatasource.fetchHomeBanners();
        return Right(discovers);
      } on ServerException catch (error) {
        return Left(FetchHomeBannerFailure(error.message));
      }
    } else {
      return Left(FetchHomeBannerFailure('Netword unavailable!'));
    }
  }
}
