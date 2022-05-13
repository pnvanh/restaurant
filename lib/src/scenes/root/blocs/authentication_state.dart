import 'package:equatable/equatable.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  String? token;

  AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    String? token,
  });

  // Unknown
  AuthenticationState.unknown() : this._();

  // Login
  AuthenticationState.authenticated(String? token)
      : this._(
          status: AuthenticationStatus.authenticated,
          token: token,
        );

  // Logout
  AuthenticationState.unauthenticated()
      : this._(
          status: AuthenticationStatus.unauthenticated,
        );

  @override
  List<dynamic> get props => [status];
}
