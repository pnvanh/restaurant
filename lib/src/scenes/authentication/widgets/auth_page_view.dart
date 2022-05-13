import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/scenes/authentication/blocs/sign_in_bloc.dart';
import 'package:restaurant/src/scenes/authentication/pages/pages.dart';

class AuthPageView extends StatefulWidget {
  const AuthPageView({Key? key}) : super(key: key);
  // final PageController pageController;
  @override
  State<AuthPageView> createState() => _AuthPageViewState();
}

class _AuthPageViewState extends State<AuthPageView> {
  final PageController _controller =
      PageController(initialPage: 0, keepPage: false);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: TextButton(
                          onPressed: () {
                            _controller.animateToPage(_controller.initialPage,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text(
                            "Create Account",
                            style: AppTextStyles.textSemiBold(
                                16,
                                currentPage != 0
                                    ? AppColors.manatee
                                    : AppColors.jungleGreen),
                          ),
                        ),
                      ),
                      Container(
                        width: 77,
                        height: 2,
                        decoration: BoxDecoration(
                          color: currentPage != 0
                              ? Colors.transparent
                              : AppColors.jungleGreen,
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: TextButton(
                          onPressed: () {
                            _controller.animateToPage(
                                _controller.initialPage + 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          },
                          child: Text(
                            "Login",
                            style: AppTextStyles.textSemiBold(
                                16.0,
                                currentPage != 0
                                    ? AppColors.jungleGreen
                                    : AppColors.manatee),
                          ),
                        ),
                      ),
                      Container(
                        width: 77.0,
                        height: 2.0,
                        decoration: BoxDecoration(
                          color: AppColors.jungleGreen
                              .withOpacity(currentPage.toDouble()),
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 30),
          height: 400,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: SignUpBody(),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: BlocProvider(
                  create: (context) => SignInBloc(context),
                  child: SignInBody(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
