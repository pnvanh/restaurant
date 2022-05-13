// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/routers/app_routers.dart';
import 'package:restaurant/src/scenes/authentication/pages/auth_page.dart';
import 'package:restaurant/src/scenes/splash/pages/splash_page.dart';

import 'src/data/repositories/authentication_repository_implement.dart';
import 'src/scenes/root/pages/root_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    RootPage(
      authenticationRepository: AuthenticationRepositoryImplement(),
    ),
  );
}

class SimpleBlocObserver extends BlocObserver {
  SimpleBlocObserver();
}
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         AppRoutes.splash: (context) => SplashPage(),
//         AppRoutes.authentication: (context) => AuthenticationPage()
//       },
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         fontFamily: 'Inter',
//         scaffoldBackgroundColor: Colors.white,
//         primarySwatch: Colors.blue,
//       ),
//       home: const SplashPage(),
//     );
//   }
// }
