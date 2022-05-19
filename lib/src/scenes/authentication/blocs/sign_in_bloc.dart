import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:restaurant/src/core/errror/exception.dart';
import 'package:restaurant/src/platform/usecase/usecase.dart';
import 'package:restaurant/src/scenes/authentication/blocs/sign_in_event.dart';
import 'package:restaurant/src/scenes/authentication/blocs/sign_in_state.dart';
import 'package:restaurant/src/scenes/widgets/email.dart';
import 'package:restaurant/src/scenes/widgets/password.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(BuildContext context)
      : signInlUseCase =
            SignInByEmailUseCase(repository: RepositoryProvider.of(context)),
        super(SignInState());

  final SignInByEmailUseCase signInlUseCase;

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInEmailChanged) {
      yield mapEmailChangedToState(event, state);
    }
    if (event is SignInPasswordChanged) {
      yield mapPasswordChangedToState(event, state);
    }
    if (event is SignInSubmited) {
      yield* mapSignInSubmittedToState(event);
    }
  }

  SignInState mapEmailChangedToState(
      SignInEmailChanged event, SignInState state) {
    final email = Email.dirty(event.email);
    final status = Formz.validate([email, state.password]);
    final emailErrorMessage = status.isInvalid ? 'Email is invalid' : null;
    return state.copyWith(
      status: status,
      email: email,
      emailErrorMessage: emailErrorMessage,
    );
  }

  SignInState mapPasswordChangedToState(
      SignInPasswordChanged event, SignInState state) {
    final password = Password.dirty(event.password);
    final status = Formz.validate([state.email, password]);
    final passwordErrorMessage = status.isInvalid
        ? 'Password must be at least 6 characters or longer'
        : null;

    return state.copyWith(
      status: status,
      password: password,
      passwordErrorMessage: passwordErrorMessage,
    );
  }

  Stream<SignInState> mapSignInSubmittedToState(SignInSubmited event) async* {
    yield state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      print('Login - Start');
      print('Email: ${state.email.value}');
      print('Password: ${state.password.value}');
      yield state.copyWith(status: FormzStatus.submissionInProgress);

      final result = await signInlUseCase
          .call(SignInEmailParams(state.email.value, state.password.value));

      yield* result.fold((l) async* {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }, (result) async* {
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      });
    } on ServerException catch (error) {
      yield state.copyWith(
          errorMessage: error.message, status: FormzStatus.submissionFailure);
    } catch (error) {
      print(error);
    }
  }
}
