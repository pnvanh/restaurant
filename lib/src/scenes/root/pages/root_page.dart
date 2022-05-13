import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/platform/repositories/repositories.dart';
import 'package:restaurant/src/scenes/root/blocs/authenticaion_bloc.dart';
import 'package:restaurant/src/scenes/root/blocs/authenticaion_event.dart';
import 'root_body.dart';

class RootPage extends StatelessWidget {
  RootPage({Key? key, required this.authenticationRepository})
      : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: authenticationRepository,
        child: BlocProvider<AuthenticationBloc>(
          create: (context) =>
              AuthenticationBloc(repository: authenticationRepository)
                ..add(AuthenticationCheckAuthSession()),
          child: RootBody(),
        ));
  }
}
