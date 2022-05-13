import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/utils/validator.dart';

class EmailTextField extends StatelessWidget {
  final bool invalid;
  final String errorMessage;
  final Function emailChanged;

  const EmailTextField({
    Key? key,
    required this.invalid,
    required this.errorMessage,
    required this.emailChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10, bottom: 12),
          child: Text(
            "Email",
            style: AppTextStyles.textSemiBold(14, AppColors.oxfordBlue),
          ),
        ),
        SizedBox(
          height: 48,
          child: TextField(
            obscureText: false,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            onChanged: (email) => emailChanged(email),
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
                hintText: "Eg pnvanh.dev@gmail.com",
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
