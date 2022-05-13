import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/routers/app_routers.dart';
import 'package:restaurant/src/scenes/splash/widgets/widgets.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  int currentPage = 0;
  String splashJson = json.encode('assets/draft/splash.json');
  List<Map<String, String>> splashData = [
    {
      "title": "Nearby restaurants",
      "description":
          "You don't have to go far to find a good restaurant,we have provided all the restaurants that is near you",
      "image": "assets/images/splash_one.png"
    },
    {
      "title": "Select the Favorites Menu",
      "description":
          "Now eat well, don't leave the house,You can choose your favorite food only with one click",
      "image": "assets/images/splash_two.png"
    },
    {
      "title": "Good food at a cheap price",
      "description":
          "You can eat at expensive restaurants with affordable price",
      "image": "assets/images/splash_three.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        Expanded(
          child: PageView.builder(
            onPageChanged: (value) => {
              setState(() {
                currentPage = value;
              })
            },
            itemCount: splashData.length,
            itemBuilder: (context, index) => SplashContent(
                title: splashData[index]["title"] ?? "",
                description: splashData[index]["description"] ?? "",
                image: splashData[index]["image"] ?? ""),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(26.0),
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: (() =>
                    {Navigator.pushNamed(context, AppRoutes.authentication)}),
                child: Text(
                  "Skip",
                  style: AppTextStyles.textRegular(16, Colors.black),
                ),
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Row(
                    children: List.generate(
                      splashData.length,
                      (index) =>
                          DotIndicator(index: index, currentPage: currentPage),
                    ),
                  )
                ],
              ),
              Spacer(),
              InkWell(
                onTap: (() => {
                      // ignore: avoid_print
                      print("Fix")
                    }),
                child: SvgPicture.asset(
                  "assets/icons/ic_next.svg",
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
