import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/scenes/tabbar/blocs/bloc.dart';
import '../../discover/pages/discover_body.dart';
import 'pages.dart';

class TabbarPage extends StatelessWidget {
  static Route route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => TabbarPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TabbarBloc(TabbarState.home()),
        ),
      ],
      child: TabbarBody(),
    );
  }
}
