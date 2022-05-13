import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<dynamic> get props => [];
}

class AuthenticationCheckAuthSession extends AuthenticationEvent {}

class AuthenticationUserChanged extends AuthenticationEvent {
  final String? token;

  AuthenticationUserChanged(this.token);

  @override
  List<dynamic> get props => [];
}

class AuthenticationLogoutRequeted extends AuthenticationEvent {}
