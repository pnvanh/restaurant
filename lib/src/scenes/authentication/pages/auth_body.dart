import 'package:flutter/material.dart';
import 'package:restaurant/src/scenes/authentication/widgets/widgets.dart';

class AuthenticationBody extends StatefulWidget {
  const AuthenticationBody({Key? key}) : super(key: key);

  @override
  State<AuthenticationBody> createState() => _AuthenticationBodyState();
}

class _AuthenticationBodyState extends State<AuthenticationBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.68,
            child: AuthenticationContent(),
          ),
          SizedBox(
            child: AuthenticationFooter(),
          )
        ],
      ),
    );
  }
}
