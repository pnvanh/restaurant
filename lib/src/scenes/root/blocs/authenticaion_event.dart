import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationCheckAuthSession extends AuthenticationEvent {}

class AuthenticationUserChanged extends AuthenticationEvent {
  final String? token;

  AuthenticationUserChanged(this.token);

  @override
  List<Object> get props => [];
}

class AuthenticationLogoutRequeted extends AuthenticationEvent {}
