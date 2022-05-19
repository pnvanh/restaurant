import 'package:flutter/material.dart';
import 'package:restaurant/src/scenes/splash/pages/pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider( create: (context) => SplashPage(),),
    //   ],
    //   child: T,
    // );
    return Scaffold(
      body: SplashBody(),
    );
  }
}
