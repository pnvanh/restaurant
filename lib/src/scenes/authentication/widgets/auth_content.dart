import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/constants.dart';

class AuthenticationContent extends StatelessWidget {
  const AuthenticationContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Container(
          width: AppSize.w300,
          height: AppSize.w300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/food.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            "Welcome",
            style: AppTextStyles.textSemiBold(24, Colors.black),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 8.0),
          child: Text(
            "Before enjoying Foodmedia services Please register first",
            style: AppTextStyles.textRegular(14, Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
