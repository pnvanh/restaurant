// ignore_for_file: prefer_initializing_formals

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:restaurant/src/scenes/widgets/widgets.dart';

class SignInState extends Equatable {
  final String? errorMessage;
  final String? emailErrorMessage;
  final String? passwordErrorMessage;

  final Email email;
  final Password password;
  final FormzStatus status;

  const SignInState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    String? errorMessage,
    String? emailErrorMessage,
    String? passwordErrorMessage,
  })  : errorMessage = errorMessage,
        emailErrorMessage = emailErrorMessage,
        passwordErrorMessage = passwordErrorMessage;

  @override
  List<dynamic?> get props => [
        status,
        errorMessage,
        emailErrorMessage,
        passwordErrorMessage,
        email,
        password,
      ];

  SignInState copyWith({
    String? errorMessage,
    String? emailErrorMessage,
    String? passwordErrorMessage,
    Email? email,
    Password? password,
    FormzStatus? status,
  }) {
    return SignInState(
      errorMessage: errorMessage ?? this.errorMessage,
      emailErrorMessage: emailErrorMessage ?? this.emailErrorMessage,
      passwordErrorMessage: passwordErrorMessage ?? this.passwordErrorMessage,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'EmailLoginState { status: $status, errorMessage: ${errorMessage ?? ''}, email: ${email.value} , password: ${password.value}, emailErrorMessage: $emailErrorMessage, passwordErrorMessage: $passwordErrorMessage.';
  }

  bool get emailInvalid => email.value.isNotEmpty && email.invalid;

  bool get passwordInvalid => password.value.isNotEmpty && password.invalid;
}
