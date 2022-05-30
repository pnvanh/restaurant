import 'package:flutter/material.dart';
import 'package:restaurant/src/data/repositories/authentication_repository_implement.dart';
import 'package:restaurant/src/scenes/root/pages/root_page.dart';
import 'package:restaurant/src/scenes/search/pages/search_page.dart';
import 'package:restaurant/src/scenes/tabbar/pages/pages.dart';

const String authenticationRoute = '/';
const String mainRoute = '/main';
const String searchRouter = '/search';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authenticationRoute:
        return MaterialPageRoute(
          builder: (_) => RootPage(
            authenticationRepository: AuthenticationRepositoryImplement(),
          ),
        );
      case mainRoute:
        return MaterialPageRoute(
          builder: (_) => TabbarPage(),
        );
      case searchRouter:
        return MaterialPageRoute(
          builder: (_) => SearchPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
