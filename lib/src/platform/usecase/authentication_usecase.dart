import 'package:dartz/dartz.dart';
import 'package:restaurant/src/core/errror/failure.dart';
import 'package:restaurant/src/core/usecase/usecase.dart';
import 'package:restaurant/src/platform/repositories/authentication_repository.dart';

class SignInEmailParams extends Params {
  final String email;
  final String password;

  const SignInEmailParams(this.email, this.password);
}

// SignIn by Email
class SignInByEmailUseCase extends UseCase<String, SignInEmailParams> {
  final AuthenticationRepository repository;

  const SignInByEmailUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(SignInEmailParams params) async {
    return await repository.signInByEmail(params.email, params.password);
  }
}
