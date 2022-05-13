import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/datasources/local/authentication_local_datasource.dart';
import 'package:restaurant/src/platform/repositories/repositories.dart';
import 'package:restaurant/src/scenes/root/blocs/authenticaion_event.dart';
import 'package:restaurant/src/scenes/root/blocs/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required AuthenticationRepository repository})
      : this.repository = repository,
        super(AuthenticationState.unknown()) {
    this.tokenSubscription = this
        .repository
        .token
        .listen((accessToken) => add(AuthenticationUserChanged(accessToken)));
  }

  final AuthenticationRepository repository;
  StreamSubscription<String?>? tokenSubscription;

  @override
  Future<void> close() {
    tokenSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationCheckAuthSession) {
      yield* mapCheckAuthSessionToState(event);
    }

    if (event is AuthenticationUserChanged) {
      yield await mapUserChangedToState(event);
    } else if (event is AuthenticationLogoutRequeted) {
      // try {
      //   repository.logout();
      // } on Exception catch (error) {
      //   print(error);
      //   throw error;
      // }
    }
  }

  Stream<AuthenticationState> mapCheckAuthSessionToState(
      AuthenticationCheckAuthSession event) async* {
    final cachedUser =
        await AuthenticationLocalDatasourceImplement.shared.getAccessToken();
    if (cachedUser.isNotEmpty) {
      yield AuthenticationState.authenticated(cachedUser);
    } else {
      yield AuthenticationState.unauthenticated();
    }
  }

  Future<AuthenticationState> mapUserChangedToState(
      AuthenticationUserChanged event) async {
    if (event.token != null) {
      return AuthenticationState.authenticated(event.token);
    }
    return AuthenticationState.unauthenticated();
  }
}
