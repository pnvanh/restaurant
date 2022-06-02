import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:restaurant/src/constants/app_constraint.dart';
import 'package:restaurant/src/data/repositories/authentication_repository_implement.dart';
import 'package:restaurant/src/routers/routers.dart';
import 'package:restaurant/src/scenes/root/pages/root_page.dart';
import 'package:restaurant/src/scenes/tabbar/pages/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLogger = prefs.getBool(IS_LOGGER) ?? false;

  Bloc.observer = SimpleBlocObserver();
  runApp(
    MyApp(
      isLogger: isLogger,
    ),
  );
}

class SimpleBlocObserver extends BlocObserver {
  SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.isLogger,
  }) : super(key: key);

  final bool isLogger;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routers.generateRoute,
      initialRoute: isLogger ? mainRoute : authenticationRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: isLogger
          ? TabbarPage()
          : RootPage(
              authenticationRepository: AuthenticationRepositoryImplement()),
    );
  }
}
