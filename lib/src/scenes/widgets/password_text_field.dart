import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/utils/validator.dart';

class PasswordTextField extends StatelessWidget {
  final bool invalid;
  final String errorMessage;
  final Function passwordChanged;

  const PasswordTextField({
    Key? key,
    required this.invalid,
    required this.errorMessage,
    required this.passwordChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10, bottom: 12),
          child: Text(
            "Password",
            style: AppTextStyles.textSemiBold(14, AppColors.oxfordBlue),
          ),
        ),
        SizedBox(
          height: 48,
          child: TextField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: true,
            keyboardType: TextInputType.visiblePassword,
            onChanged: (password) => passwordChanged(password),
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
                hintText: "••••••••••",
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
