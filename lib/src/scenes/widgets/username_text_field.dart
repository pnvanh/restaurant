import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/utils/validator.dart';

class UsernameTextField extends StatefulWidget {
  const UsernameTextField({
    Key? key,
    required this.usernameChanged,
  }) : super(key: key);
  final Function usernameChanged;
  @override
  State<UsernameTextField> createState() =>
      _UsernameTextFieldState(usernameChanged);
}

class _UsernameTextFieldState extends State<UsernameTextField> {
  final Function usernameChanged;
  final TextEditingController emailController = TextEditingController();
  late bool invalid = false;
  String errorMessage = "";

  _UsernameTextFieldState(this.usernameChanged);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10, bottom: 12),
          child: Text(
            "Username",
            style: AppTextStyles.textSemiBold(14, AppColors.oxfordBlue),
          ),
        ),
        SizedBox(
          height: 48,
          child: TextField(
            autofocus: false,
            obscureText: false,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            onChanged: (username) => {
              setState(() {
                errorMessage = UsernameValidator.validate(username) ?? "";
                errorMessage.isEmpty ? invalid = false : invalid = true;
                if (errorMessage.isEmpty) {
                  usernameChanged(username);
                }
              })
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: AppColors.grayChateau),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: AppColors.oxfordBlue),
                ),
                filled: true,
                hintStyle: AppTextStyles.textRegular(12, AppColors.grayChateau),
                hintText: "Eg username",
                fillColor: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: invalid ? 0.0 : 8.0),
          child: Visibility(
            visible: invalid,
            child: Container(
              padding: EdgeInsets.only(left: 10.0, top: 4.0, right: 10.0),
              child: Text(
                errorMessage,
                style: AppTextStyles.textRegular(
                    12, invalid ? Colors.red : Colors.transparent),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
