import 'package:flutter/material.dart';
import 'package:restaurant/src/scenes/authentication/pages/pages.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AuthenticationBody());
  }
}
