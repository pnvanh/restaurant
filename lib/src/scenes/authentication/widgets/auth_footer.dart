import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/scenes/authentication/widgets/widgets.dart';

class AuthenticationFooter extends StatelessWidget {
  const AuthenticationFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 49.0,
          width: 256.0,
          margin: EdgeInsets.only(top: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.symmetric(horizontal: 74.0, vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              primary: AppColors.jungleGreen,
              onPrimary: AppColors.scandal,
            ),
            onPressed: () {
              bottomSheet(context);
            },
            child: Text(
              "Create Account",
              style: AppTextStyles.textBold(14, Colors.white),
            ),
          ),
        ),
        Container(
          height: 49.0,
          width: 256.0,
          margin: const EdgeInsets.only(top: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 74, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              primary: AppColors.scandal,
              onPrimary: AppColors.jungleGreen,
            ),
            onPressed: () {
              bottomSheet(context);
            },
            child: Text(
              "Login",
              style: AppTextStyles.textBold(14, AppColors.jungleGreen),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16.0),
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'By logging in or registering, You have agreed to',
                    style: AppTextStyles.textRegular(12, Colors.black)),
                TextSpan(
                  text: ' The Terms and Conditions',
                  style: AppTextStyles.textRegular(12, AppColors.jungleGreen),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print('Tap Here onTap'),
                ),
                TextSpan(
                    text: ' And ',
                    style: AppTextStyles.textRegular(12, Colors.black)),
                TextSpan(
                  text: 'Privacy Policy',
                  style: AppTextStyles.textRegular(12, AppColors.jungleGreen),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print('Tap Here onTap'),
                ),
              ],
            ),
            textAlign: TextAlign.center,
            style: AppTextStyles.textRegular(12, Colors.black),
          ),
        ),
      ],
    );
  }
}

void bottomSheet(context) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
    ),
    builder: (BuildContext context) {
      return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Wrap(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 30.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 48,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColors.iron,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
              AuthPageView()
            ],
          ));
    },
  );
}
