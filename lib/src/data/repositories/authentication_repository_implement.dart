import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:restaurant/src/core/errror/error.dart';
import 'package:restaurant/src/core/errror/failure.dart';
import 'package:restaurant/src/core/network/network_info.dart';
import 'package:restaurant/src/datasources/local/authentication_local_datasource.dart';
import 'package:restaurant/src/datasources/remote/authentication_remote_datasource.dart';
import 'package:restaurant/src/platform/repositories/repositories.dart';

class SignFailure extends Failure {
  final String message;
  SignFailure(this.message);
}

class AuthenticationRepositoryImplement extends AuthenticationRepository {
  final networkInfo = NetworkInfoImplement();
  final localDatasource = AuthenticationLocalDatasourceImplement();
  final remoteDatasource = AuthenticationRemoteDatasourceImplement();
  final controller = StreamController<String?>();

  AuthenticationRepositoryImplement();

  @override
  Future<Either<Failure, String>> signInByEmail(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final accessToken =
            await remoteDatasource.signInByEmail(email, password);

        localDatasource.saveAccessToken(accessToken);
        return Right(accessToken);
      } on ServerException catch (error) {
        return Left(SignFailure(error.message));
      }
    } else {
      //-TODO: get cache user
      return Left(SignFailure('Failure!'));
    }
  }

  @override
  Stream<String?> get token async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    try {
      await AuthenticationLocalDatasourceImplement.shared.getAccessToken();
      yield* controller.stream;
    } on CacheException catch (_) {}
  }
}
