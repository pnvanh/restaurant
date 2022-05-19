import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/data/repositories/authentication_repository_implement.dart';
import 'package:restaurant/src/routers/routers.dart';
import 'package:restaurant/src/scenes/root/pages/root_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MyApp(),
  );
}

class SimpleBlocObserver extends BlocObserver {
  SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routers.generateRoute,
      initialRoute: authenticationRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: RootPage(
          authenticationRepository: AuthenticationRepositoryImplement()),
    );
  }
}
