import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent(
      {Key? key,
      required this.title,
      required this.description,
      required this.image})
      : super(key: key);
  final String title, description, image;

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
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            title,
            style: AppTextStyles.textSemiBold(24, Colors.black),
          ),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 16,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: Text(
            description,
            style: AppTextStyles.textRegular(12, Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        Spacer()
      ],
    );
  }
}
