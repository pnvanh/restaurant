import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/data/repositories/authentication_repository_implement.dart';
import 'package:restaurant/src/scenes/authentication/pages/pages.dart';
import 'package:restaurant/src/scenes/root/blocs/authenticaion_bloc.dart';

class RootBody extends StatefulWidget {
  @override
  RootBodyState createState() => RootBodyState();
}

class RootBodyState extends State<RootBody> {
  final navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get navigator => navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: BlocProvider(
        create: (context) =>
            AuthenticationBloc(repository: AuthenticationRepositoryImplement()),
        child: AuthenticationPage(),
      ),
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}

class SplashPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/splash_one.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
