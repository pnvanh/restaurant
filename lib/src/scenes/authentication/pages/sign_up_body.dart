import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/scenes/widgets/widgets.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  late String _emailString = "";
  late String _usernameString = "";
  late String _passwordString = "";
  late bool _isButtonDisabled;

  @override
  void initState() {
    super.initState();
    _isButtonDisabled = true;
  }

  void _checkValidateInput() {
    setState(() {
      if (_emailString.isNotEmpty &&
          _usernameString.isNotEmpty &&
          _passwordString.isNotEmpty) {
        _isButtonDisabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EmailTextField(
          invalid: false,
          emailChanged: (email) => {
            setState(() {
              _emailString = email;
              _checkValidateInput();
            })
          },
          errorMessage: '',
        ),
        UsernameTextField(
          usernameChanged: (username) => {
            setState(() {
              _usernameString = username;
              _checkValidateInput();
            })
          },
        ),
        PasswordTextField(
          passwordChanged: (password) => {
            setState(() {
              _passwordString = password;
              _checkValidateInput();
            })
          },
          errorMessage: '',
          invalid: false,
        ),
        Container(
          height: 49.0,
          width: 256.0,
          margin: EdgeInsets.only(top: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              primary: AppColors.jungleGreen,
              onPrimary: AppColors.scandal,
            ),
            onPressed: _isButtonDisabled
                ? null
                : () {
                    print(_passwordString);
                  },
            child: Text(
              "Register",
              style: AppTextStyles.textBold(14, Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
