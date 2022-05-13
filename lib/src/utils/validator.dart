import 'package:flutter/material.dart';

var textEditingController = TextEditingController();

class EmailValidator {
  static String? validate(String value) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value);
    if (value.isEmpty) {
      return "Enter your Email address";
    } else {
      if (!emailValid) {
        return "Enter a valid Email address";
      } else {
        return null;
      }
    }
  }
}

class PasswordValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return "Enter your password";
    } else if (value.length < 6) {
      return "Password must have 6 characters";
    } else {
      return null;
    }
  }
}

class UsernameValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return "Enter your Username";
    } else if (value.contains(" ")) {
      return "Username can't have space characters";
    } else if (value.length < 6) {
      return "Username must have 6 characters";
    } else {
      return null;
    }
  }
}
