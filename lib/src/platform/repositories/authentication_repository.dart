import 'package:dartz/dartz.dart';
import 'package:restaurant/src/core/errror/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, String>> signInByEmail(String email, String password);
  Stream<String?> get token;
}
